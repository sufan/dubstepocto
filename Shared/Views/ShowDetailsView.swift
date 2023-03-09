//
//  ShowDetailsView.swift
//  Potpourri
//
//  Created by sufan on 9/1/20.
//

import SwiftUI

struct ShowDetailsView: View {
    private let relativeWidth: CGFloat = 0.9
    
    @Environment(\.geometry) var geometry
    @State private var summaryAttributed: NSAttributedString?
    
    var show: TVShowModel?
    
    var body: some View {
        ScrollView {
            if let show {
                LazyVStack(alignment: .leading) {
                    Text(show.longDescription)
                        .font(.callout)
                    HStack() {
                        Spacer()
                        // Allocate enough space for the image to prevent resizing visual glitch
                        ImageView(imageName: show.image?.original.httpsString)
                            .aspectFrame(width: geometry.width * relativeWidth, aspectRatio: .A4)
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
                    if let summaryAttributed {
                        Text(formatSummary(summaryAttributed))
                    }
                }
                .navigationTitle(show.name)
                .padding(.horizontal)
                .task {
                    summaryAttributed = show.summary?.attributedHTML
                }
            }
        }
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                NavigationView {
                    ShowDetailsView(show: previewShow)
                        .environment(\.geometry, geometry.size)
                }
            })
            GeometryReader(content: { geometry in
                NavigationView {
                    ShowDetailsView(show: previewShow)
                        .environment(\.geometry, geometry.size)
                        .previewDevice("iPhone SE (3rd generation)")
                        .environment(\.locale, .init(identifier: "en_GB"))
                }
            })
        }
    }
}

private extension ShowDetailsView {
    // changed default font to dynamic font.  this remove bold and italics attributed
    // TODO: fix html attributed string to use dynamic font
    func formatSummary(_ text: NSAttributedString?) -> AttributedString {
        guard let text else {
            return AttributedString()
        }
        
       var formatedSummary = AttributedString(text)
        formatedSummary.font = .body
        return formatedSummary
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
