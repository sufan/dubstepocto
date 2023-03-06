//
//  TabSearchView.swift
//  Potpourri
//
//  Created by sufan on 3/2/23.
//

import Alamofire
import SwiftUI


struct TabSearchView: View {
    @State private var searchableText = ""
    @State private var searchResults = [TVShowSearchModel]()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                GeometryReader(content: { geometry in
                    ScrollView {
                        LazyVStack {
                            ForEach(searchResults) { result in
                                if let show = result.show {
                                    TabTodayCell(show: show)
                                    Divider()
                                        .padding(.leading)
                                }
                            }
                        }
                        .padding(.trailing)
                        .navigationTitle("MAIN_TABVIEW_SEARCH")
                        .environment(\.geometry, geometry.size)
                    }
                })
            }
            .searchable(text: $searchableText, prompt: "Shows, People, Genres and More")
            .onSubmit(of: .search, onSubmit)
        } else {
            // TODO: Fallback on earlier versions
            Text("Only available in iOS 16.0 or newer")
        }
    }
    
    func onSubmit() {
        Task {
            let endPoint = TVEndPoints().endPoint
            endPoint.path = TVEndPoints.searchShowsPath
            endPoint.queryItems = [
                URLQueryItem(name: "q", value: searchableText)
            ]
            
            guard let url = endPoint.url?.absoluteString else {
                return
            }
            
            AF.request(url)
                .validate()
                .responseDecodable(of: [TVShowSearchModel].self) { response in
                    guard let schedules = response.value else {
                        debugPrint(response)
                        return
                    }
                    
                    searchResults = schedules
                }
        }
    }
}

struct TabSearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabSearchView()
            TabSearchView()
                .previewDevice("iPhone SE (3rd generation)")
                .environment(\.locale, .init(identifier: "en_GB"))
        }
    }
}
