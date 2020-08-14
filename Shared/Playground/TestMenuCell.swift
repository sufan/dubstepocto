//
//  TestMenuCell.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct TestMenuCell: View {
    @Environment(\.geometry) var geometry
    let relativeWidth: CGFloat = 0.36
    var recipe: Recipe
    
    var body: some View {
        NavigationLink(destination: TestRecipeView(recipe: recipe)) {
            HStack {
                WebImage(url: URL(string: recipe.imageName))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .transition(.fade(duration: 0.5))
                    .aspectFrame(width: geometry.width * relativeWidth, aspectRatio: .wide)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(3)
                
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .lineLimit(4)
                    Text("\(recipe.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if recipe.isPopular {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct TestMenuCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader(content: { geometry in
                List {
                    TestMenuCell(recipe: testData[0])
                }
                .environment(\.geometry, geometry.size)
            })
            GeometryReader(content: { geometry in
                List {
                    TestMenuCell(recipe: testData[0])
                }
                .environment(\.geometry, geometry.size)
            })
            .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
