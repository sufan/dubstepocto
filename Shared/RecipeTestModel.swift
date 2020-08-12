//
//  RecipeTestModel.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredientCount: Int
    var isFavorited: Bool = false
    var thumbnailName: String
}
