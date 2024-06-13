//
//  Meal.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation


struct Meal: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}
