//
//  TestLazyView.swift
//  Potpourri
//
//  Created by sufan on 8/18/20.
//

import SwiftUI

struct TestLazyView: View {
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
                            TestMenuCell(schedule: schedule)
                            Divider()
                                .padding(.leading)
                        }
                    }
                    .padding(.trailing)
                    .navigationTitle("Schedules")
                    .environment(\.geometry, geometry.size)
                }
            })
            
            Text("Select a show")
                .font(.largeTitle)
        }
    }
}

struct TestLazyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestLazyView(scheduleObservable: TVObserverable(source: .preview))
            TestLazyView(scheduleObservable: TVObserverable(source: .preview))
                .preferredColorScheme(.dark)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
