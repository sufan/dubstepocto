//
//  ShowDetailsView.swift
//  Potpourri
//
//  Created by sufan on 9/1/20.
//

import SwiftUI

struct ShowDetailsView: View {
    private let relativeWidth: CGFloat = 0.9

    var show: TVShowModel?
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                if let show {
                    LazyVStack(alignment: .leading) {
                        Text(show.longDescription)
                            .font(.callout)
                        HStack() {
                            Spacer()
                            // Allocate enough space for the image to prevent resizing visual glitch
                            ImageView(imageName: show.image?.original.httpsString)
                                .aspectFrame(width: geometry.size.width * relativeWidth, aspectRatio: .A4)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 8) {
                                ForEach(show.genres, id: \.self) { genre in
                                    Text(genre)
                                        .font(.footnote)
                                        .padding(6)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                                }
                            }
                        }
                        Divider()
                        Text(show.summary ?? "")
                            .font(.body)
                    }
                    .navigationTitle(show.name)
                    .padding(.horizontal)
                }
            }
        })
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShowDetailsView(show: testShow)
        }
    }
}

private extension TVShowModel {
    var longDescription: String {
        var description = [String]()
        
        description.append(type)
        if let date = premiered?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            
            description.append(formatter.string(from: date))
        }
        if let runtime = runtime {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .short
            
            description.append(formatter.string(from: TimeInterval(runtime * 60)) ?? "")
        }
        
        return description.joined(separator: " · ")
    }
}
