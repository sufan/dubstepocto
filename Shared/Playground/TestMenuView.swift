//
//  TestMenuView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct TestMenuView: View {
    @EnvironmentObject var store: StoreData
    
    var body: some View {
        NavigationView {
            GeometryReader(content: { geometry in
                List {
                    Toggle("Popular Only", isOn: $store.showPopularOnly)
                    
                    ForEach(store.menu) { recipe in
                        if !self.store.showPopularOnly || recipe.isPopular {
                            TestMenuCell(recipe: recipe)
                        }
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
                .environment(\.geometry, geometry.size)
            })
            
            Text("Select an Entrée")
                .font(.largeTitle)
        }
    }
    
    func addRecipe() {
        withAnimation {
            store.menu.append(testRecipe)
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
            TestMenuView()
                .environmentObject(StoreData())
            TestMenuView()
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraLarge)
                .environmentObject(StoreData())
        }
    }
}
