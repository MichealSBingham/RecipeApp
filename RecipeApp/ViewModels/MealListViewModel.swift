//
//  MealListViewModel.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation


/// ViewModel for managing the list of meals.
/// Fetches meals from the API and handles loading and error states.
class MealListViewModel: ObservableObject {
    @Published var meals = [Meal]() ///< The list of meals.
    @Published var isLoading = false ///< Indicates whether the data is being loaded.
    @Published var errorMessage: String? = nil ///< Stores any error messages.
    
    private let networkManager = NetworkManager()
    
    /// Fetches the list of meals from the API.
    /// Updates `meals`, `isLoading`, and `errorMessage` properties based on the result.
    func fetchMeals() {
        isLoading = true
        errorMessage = nil
        
        networkManager.fetchMeals { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let meals):
                    self.meals = meals.sorted(by: { $0.name < $1.name })
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
