//
//  TabTodayCell.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct TabTodayCell: View {
    @Environment(\.geometry) var geometry
    
    private let relativeWidth: CGFloat = 0.28
    var schedule: TVScheduleModel?
    var show: TVShowModel?
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: ShowDetailsView(show: show)) {
            if let show {
                HStack(alignment: .center) {
                    WebImage(url: URL(string: show.image?.medium.httpsString ?? ""))
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .transition(.fade(duration: 0.5))
                        .aspectRatio(contentMode: .fit)
                        .aspectFrame(width: geometry.width * relativeWidth, aspectRatio: .A4)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text(show.network?.name ?? "")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                        Text(show.name)
                            .font(.title3)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        if let schedule = schedule {
                            Text("MAIN_TABVIEW_TODAY_SEASON_EPISODE \(NSNumber(value: schedule.season), formatter: NumberFormatter()) \(schedule.number ?? 0)")
                                .font(.body)
                                .foregroundColor(.secondary)
                            if let date = schedule.airstamp.date {
                                Text(dateFormatter.string(from: date))
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                        } else {
                            Text(show.shortDescription)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                            
                            Text(show.genresDescription)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct TabTodayCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                List {
                    TabTodayCell(show: testShow)
                }
                .environment(\.geometry, geometry.size)
            })
            GeometryReader(content: { geometry in
                List {
                    TabTodayCell(schedule: testSchedules[1])
                }
                .environment(\.geometry, geometry.size)
            })
            .previewDevice("iPhone SE (3rd generation)")
            .environment(\.locale, .init(identifier: "en_GB"))
        }
    }
}

extension TabTodayCell {
    init(schedule: TVScheduleModel?) {
        self.schedule = schedule
        self.show = schedule?.show
    }
    
    init(show: TVShowModel?) {
        self.show = show
    }
}

private extension TVShowModel {
    var shortDescription: String {
        var description = [String]()
        
        if let date = premiered?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            
            description.append(formatter.string(from: date))
        }
        description.append(type)
        
        return description.joined(separator: " · ")
    }
    
    var genresDescription: String {
        return genres.joined(separator: ", ")
    }
}
