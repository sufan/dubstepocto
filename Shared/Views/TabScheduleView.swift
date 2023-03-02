//
//  TabScheduleView.swift
//  Potpourri
//
//  Created by sufan on 8/27/20.
//

import SwiftUI

struct TabScheduleView: View {
    @ObservedObject var scheduleObservable: TVObserverable
    
    var columns = [
        GridItem(.adaptive(minimum: 100, maximum: 125))
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader(content: { geometry in
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(scheduleObservable.schedules) { schedule in
                            TabScheduleCell(schedule: schedule)
                        }
                    }
                    .navigationTitle("Schedules")
                    .environment(\.geometry, geometry.size)
                }
            })
            
            Text("Select a show")
                .font(.largeTitle)
        }
    }
}

struct TabScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
            TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
                .previewDevice("iPhone SE (2nd generation)")
            TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
