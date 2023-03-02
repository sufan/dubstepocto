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
        NavigationView {
            GeometryReader(content: { geometry in
                ScrollView {
                    if scheduleObservable.schedules.count == 0 {
                        ProgressView()
                            .offset(y: geometry.size.height/2)
                    }
                    
                    LazyVStack {
                        ForEach(scheduleObservable.schedules) { schedule in
                            TabTodayCell(schedule: schedule)
                            Divider()
                                .padding(.leading)
                        }
                    }
                    .padding(.trailing)
                    .navigationTitle("Today")
                    .environment(\.geometry, geometry.size)
                }
            })
            
            Text("Select a show")
                .font(.largeTitle)
        }
    }
}

struct TabTodayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabTodayView(scheduleObservable: TVObserverable(source: .preview))
            TabTodayView(scheduleObservable: TVObserverable(source: .preview))
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
