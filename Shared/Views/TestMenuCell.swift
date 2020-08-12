//
//  TestMenuCell.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SwiftUI

struct TestMenuCell: View {
    var recipe: Recipe
    var body: some View {
        NavigationLink(destination: TestRecipeView(recipe: recipe)) {
            Image(systemName: recipe.thumbnailName)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                Text("\(recipe.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TestMenuCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TestMenuCell(recipe: testData[0])
        }
    }
}
