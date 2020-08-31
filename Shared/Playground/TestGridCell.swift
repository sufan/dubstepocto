//
//  TestGridCell.swift
//  Potpourri
//
//  Created by sufan on 8/27/20.
//

import SwiftUI

struct TestGridCell: View {
    @Environment(\.geometry) var geometry
    
    var schedule: TVScheduleModel
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: TestRecipeView(show: schedule.show)) {
            VStack(spacing: 4) {
                if let date = schedule.date {
                    Text(dateFormatter.string(from: date))
                        .font(.title3)
                        .foregroundColor(.primary)
                }

                ImageView(imageName: schedule.show?.image?.medium.httpsString ?? "photo")
                    .aspectRatio(contentMode: .fit)

                if let name = schedule.show?.name {
                    Text(name)
                        .font(.title3)
                }
                
                Spacer()
            }
        }
    }
}

struct TestGridCell_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader(content: { geometry in
            List {
                TestGridCell(schedule: testSchedule)
            }
            .environment(\.geometry, geometry.size)
        })
    }
}
