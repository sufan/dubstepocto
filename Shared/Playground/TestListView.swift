//
//  TestMenuView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct TestListView: View {
    @ObservedObject var scheduleObservable: TVObserverable
    
    var body: some View {
        NavigationView {
            GeometryReader(content: { geometry in
                List {
                    if scheduleObservable.schedules.count == 0 {
                        ProgressView()
                            .offset(y: geometry.size.height/2)
                    }
                    
                    ForEach(scheduleObservable.schedules) { schedule in
                        // TODO: Fix data to support grouping
                        Section(header: Text(schedule.show?.network?.name ?? "UNKNOWN")) {
                            TabTodayCell(schedule: schedule)
                        }
                    }
                    .onMove(perform: moveRecipe)
                    .onDelete(perform: deleteRecipe)                    
                }
                .navigationTitle("Schedules")
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif
                    Button("Add", action: addRecipe)
                }
                .environment(\.geometry, geometry.size)
            })
            
            Text("Select a show")
                .font(.largeTitle)
        }
    }
    
    func addRecipe() {
        withAnimation {
            scheduleObservable.schedules.append(testSchedule)
        }
    }
    
    func moveRecipe(from: IndexSet, to: Int) {
        withAnimation {
            scheduleObservable.schedules.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            scheduleObservable.schedules.remove(atOffsets: offsets)
        }
    }
}

struct TestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestListView(scheduleObservable: TVObserverable(source: .preview))
            TestListView(scheduleObservable: TVObserverable(source: .preview))
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraLarge)
        }
    }
}
