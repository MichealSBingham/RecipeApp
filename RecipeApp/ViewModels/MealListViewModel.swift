//
//  MealListViewModel.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation

class MealListViewModel: ObservableObject {
    @Published var meals = [Meal]()
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let networkManager = NetworkManager()
    
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
