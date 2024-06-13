//
//  MealListView.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation
import SwiftUI




/// View for displaying the list of meals.
struct MealListView: View {
    @StateObject var viewModel = MealListViewModel() ///< The ViewModel for managing meal list data.
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    List(viewModel.meals) { meal in
                        NavigationLink(destination: MealDetailView(mealID: meal.id)) {
                            HStack {
                                AsyncImageView(url: meal.thumbnail)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                                
                                Text(meal.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                if viewModel.meals.isEmpty {
                    viewModel.fetchMeals()
                }
            }
        }
    }
}
