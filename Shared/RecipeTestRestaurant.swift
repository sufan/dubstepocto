//
//  RecipeTestRestaurant.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import Foundation

let testStore = Restaurant(menu: testData)

let testData = [
    Recipe(name: "Scallops Provencal", ingredientCount: 4, isFavorited: false, thumbnailName: "sun.max"),
    Recipe(name: "Sweet Potato Casserole", ingredientCount: 4, isFavorited: true, thumbnailName: "sunrise"),
    Recipe(name: "Pot Roast", ingredientCount: 3, isFavorited: false, thumbnailName: "sun.dust"),
    Recipe(name: "French Toast", ingredientCount: 5, isFavorited: true, thumbnailName: "sun.haze"),
    Recipe(name: "Shrimp Scampi with Linguini", ingredientCount: 2, isFavorited: false, thumbnailName: "moon"),
    Recipe(name: "Chicken Piccata", ingredientCount: 4, isFavorited: true, thumbnailName: "sparkles"),
    Recipe(name: "Garlic Roasted Potatoes", ingredientCount: 2, isFavorited: false, thumbnailName: "cloud"),
]

class Restaurant: ObservableObject {
    @Published var menu: [Recipe]
    
    init(menu: [Recipe] = []) {
        self.menu = menu
    }
}
