//
//  RecipeView.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SwiftUI

struct TestRecipeView: View {
    @State private var zoomed = false

    var recipe: Recipe
    
    var body: some View {
        VStack {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Image(systemName: recipe.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            if recipe.isFavorited && !zoomed {
                HStack {
                    Spacer()
                    Label("Favorited", systemImage: "heart.fill")
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(Font.headline.smallCaps())
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                .foregroundColor(.yellow)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(recipe.name)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TestRecipeView(recipe: testData[0])
            }
            NavigationView {
                TestRecipeView(recipe: testData[1])
            }
        }
    }
}
