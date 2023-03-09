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
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(scheduleObservable.schedules) { schedule in
                        TabScheduleCell(schedule: schedule)
                    }
                }
                .navigationTitle("MAIN_TABVIEW_SCHEDULE")
            }
        }
    }
}

struct TabScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
                    .environment(\.geometry, geometry.size)
            })
            GeometryReader(content: { geometry in
                TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
                    .environment(\.geometry, geometry.size)
                    .previewDevice("iPhone SE (3rd generation)")
                    .environment(\.locale, .init(identifier: "en_GB"))
            })
        }
    }
}
