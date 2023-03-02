//
//  TabSearchView.swift
//  Potpourri
//
//  Created by sufan on 3/2/23.
//

import SwiftUI

struct TabSearchView: View {
    @State private var searchableText = ""

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                Text("Searching for \(searchableText)")
                    .navigationTitle("Search")
            }
            .searchable(text: $searchableText, prompt: "Names, Peoples, Genres, and More")
        } else {
            // TODO: Fallback on earlier versions
        }
    }
}

struct TabSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TabSearchView()
    }
}
