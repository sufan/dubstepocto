//
//  TabTodayView.swift
//  Potpourri
//
//  Created by sufan on 8/18/20.
//

import SwiftUI

struct TabTodayView: View {
    @ObservedObject var scheduleObservable: TVObserverable
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(scheduleObservable.schedules) { schedule in
                            TabTodayCell(schedule: schedule)
                            Divider()
                                .padding(.leading)
                        }
                    }
                    .padding(.trailing)
                    .navigationTitle("MAIN_TABVIEW_TODAY")
                }
            }
        }
    }
}

struct TabTodayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                TabTodayView(scheduleObservable: TVObserverable(source: .preview))
                    .environment(\.geometry, geometry.size)
            })
            GeometryReader(content: { geometry in
                TabTodayView(scheduleObservable: TVObserverable(source: .preview))
                    .environment(\.geometry, geometry.size)
                    .previewDevice("iPhone SE (3rd generation)")
                    .environment(\.locale, .init(identifier: "en_GB"))
            })
        }
    }
}
