//
//  RecipeView.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import MapKit
import SDWebImageSwiftUI
import SwiftUI

struct TestRecipeView: View {
    @EnvironmentObject var store: StoreData
    @State private var zoomed = false
    var recipe: Recipe
    
    var recipeIndex: Int {
        store.menu.firstIndex(where: { $0.id == recipe.id }) ?? 0
    }
    
    var body: some View {
        Group {
            VStack {
                if zoomed {
                    ImageView(imageName: recipe.imageName)
                        .aspectRatio(contentMode: zoomed ? .fill : .fit)
                        .onTapGesture {
                            withAnimation {
                                zoomed.toggle()
                            }
                        }
                } else {
                    CircleImage(imageName: recipe.imageName)
                        .aspectRatio(contentMode: zoomed ? .fill : .fit)
                        .onTapGesture {
                            withAnimation {
                                zoomed.toggle()
                            }
                        }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Ingredients")
                                .font(.largeTitle)
                            
                            Spacer()
                            
                            Button(action: {
                                store.menu[recipeIndex].isPopular.toggle()
                            }) {
                                if store.menu[recipeIndex].isPopular {
                                    Image(systemName: "star.fill")
                                        .font(.title)
                                        .foregroundColor(.yellow)
                                } else {
                                    Image(systemName: "star")
                                        .font(.title)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        
                        HStack(alignment: .top) {
                            let hashValue = abs(recipe.name.hash)
                            ForEach(1..<recipe.ingredientCount+1) { i in
                                let ingredientIndex = hashValue/(i*10) % recipe.ingredientCount
                                Image(systemName: ingredients[ingredientIndex])
                                    .font(.headline)
                                    .imageScale(.large)
                            }
                            Spacer()
                        }
                    }
                    .padding(.all)
                    .transition(.move(edge: .bottom))
                    
                    Spacer()
                }
            }
        }
        .navigationTitle(recipe.name)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TestRecipeView(recipe: testData[0])
                .environmentObject(StoreData())
        }
    }
}
