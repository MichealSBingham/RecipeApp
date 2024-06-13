//
//  MealDetailViewModel.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation


/// ViewModel for managing the details of a specific meal.
/// Fetches meal details from the API and handles loading and error states.
class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail? = nil ///< The detailed information about a meal.
    @Published var isLoading = false ///< Indicates whether the data is being loaded.
    @Published var errorMessage: String? = nil ///< Stores any error messages.
    
    private let networkManager = NetworkManager()
    
    /// Fetches the details of a specific meal by its ID.
    /// - Parameter id: The ID of the meal to fetch details for.
    /// Updates `mealDetail`, `isLoading`, and `errorMessage` properties based on the result.
    func fetchMealDetail(id: String) {
        isLoading = true
        errorMessage = nil
        
        networkManager.fetchMealDetail(id: id) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let mealDetail):
                    self.mealDetail = mealDetail
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
