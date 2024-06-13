//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/12/24.
//

import SwiftUI

/// The main entry point for the RecipeApp.
@main
struct RecipeAppApp: App {
    var body: some Scene {
        WindowGroup {
            MealListView()
        }
    }
}
