//
//  TestMenuCell.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct TestMenuCell: View {
    @Environment(\.geometry) var geometry
    @State var isPopular = Bool.random()
    
    private let relativeWidth: CGFloat = 0.28
    var schedule: TVScheduleModel
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: TestRecipeView(show: schedule.show)) {
            HStack(alignment: .center) {
                WebImage(url: URL(string: schedule.show?.image?.medium.httpsString ?? ""))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .transition(.fade(duration: 0.5))
                    .aspectRatio(contentMode: .fit)
                    .aspectFrame(width: geometry.width * relativeWidth, aspectRatio: .A4)
                    .cornerRadius(3)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(schedule.show?.network?.name ?? "")
                        .font(.title3)
                        .foregroundColor(.primary)
                    Text(schedule.show?.name ?? schedule.name)
                        .font(.title3)
                    Text("Season \(NSNumber(value: schedule.season), formatter: NumberFormatter()) Episode \(schedule.number ?? 0)")
                        .font(.body)
                        .foregroundColor(.secondary)
                    if let date = schedule.date {
                        Text(dateFormatter.string(from: date))
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct TestMenuCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                List {
                    TestMenuCell(schedule: testSchedule)
                }
                .environment(\.geometry, geometry.size)
            })
            GeometryReader(content: { geometry in
                List {
                    TestMenuCell(schedule: testSchedules[1])
                }
                .environment(\.geometry, geometry.size)
            })
            .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
