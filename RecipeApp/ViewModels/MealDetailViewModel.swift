//
//  MealDetailViewModel.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail? = nil
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let networkManager = NetworkManager()
    
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
