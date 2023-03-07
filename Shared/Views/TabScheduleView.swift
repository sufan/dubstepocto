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
        if #available(iOS 16.0, *) {
            NavigationStack {
                GeometryReader(content: { geometry in
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(scheduleObservable.schedules) { schedule in
                                TabScheduleCell(schedule: schedule)
                            }
                        }
                        .navigationTitle("MAIN_TABVIEW_SCHEDULE")
                        .environment(\.geometry, geometry.size)
                    }
                })
            }
        }
    }
}

struct TabScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
            TabScheduleView(scheduleObservable: TVObserverable(source: .preview))
                .previewDevice("iPhone SE (3rd generation)")
                .environment(\.locale, .init(identifier: "en_GB"))
        }
    }
}
