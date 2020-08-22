//
//  TestMenuView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct TestMenuView: View {
    @ObservedObject var observed: TVObserverable
    
    var body: some View {
        NavigationView {
            GeometryReader(content: { geometry in
                List {                    
                    ForEach(observed.schedules) { character in
                        TestMenuCell(schedule: character)
                    }
                    .onMove(perform: moveRecipe)
                    .onDelete(perform: deleteRecipe)
                    
                    HStack {
                        Spacer()
                        Text("\(observed.schedules.count) characters")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .navigationTitle("Characters")
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif
                    Button("Add", action: addRecipe)
                }
                .environment(\.geometry, geometry.size)
            })
            
            Text("Select a character")
                .font(.largeTitle)
        }
    }
    
    func addRecipe() {
        withAnimation {
            observed.schedules.append(testSchedule)
        }
    }
    
    func moveRecipe(from: IndexSet, to: Int) {
        withAnimation {
            observed.schedules.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            observed.schedules.remove(atOffsets: offsets)
        }
    }
}

struct TestMenuView_Previews: PreviewProvider {
    class RMTestObserverable: TVObserverable {
        override init() {
            super.init()
            self.schedules = testSchedules
        }
    }

    static var previews: some View {
        Group {
            TestMenuView(observed: RMTestObserverable())
            TestMenuView(observed: RMTestObserverable())
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraLarge)
        }
    }
}
