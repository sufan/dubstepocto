//
//  TestMenuView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct TestMenuView: View {
    @ObservedObject var store: Restaurant
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.menu) { recipe in
                    TestMenuCell(recipe: recipe)
                }
                .onMove(perform: moveRecipe)
                .onDelete(perform: deleteRecipe)
                
                HStack {
                    Spacer()
                    Text("\(store.menu.count) Entrée")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: addRecipe)
            }
            
            Text("Select a Entrée")
                .font(.largeTitle)
        }
    }
    
    func addRecipe() {
        withAnimation {
            store.menu.append(Recipe(name: "Deviled Eggs", ingredientCount: 3, thumbnailName: "leaf"))
        }
    }
    
    func moveRecipe(from: IndexSet, to: Int) {
        withAnimation {
            store.menu.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            store.menu.remove(atOffsets: offsets)
        }
    }
}

struct TestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestMenuView(store: testStore)
            TestMenuView(store: testStore)
                .environment(\.sizeCategory, .accessibilityExtraLarge)
            TestMenuView(store: testStore)
                .preferredColorScheme(.dark)
        }
    }
}
