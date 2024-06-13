//
//  MealDetailView.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import SwiftUI



struct MealDetailView: View {
    @StateObject var viewModel = MealDetailViewModel()
    let mealID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else if let mealDetail = viewModel.mealDetail {
                    AsyncImageView(url: mealDetail.thumbnail)
                        .frame(height: 200)
                        .cornerRadius(8)
                    
                    Text(mealDetail.name)
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    Text("Ingredients:")
                        .font(.headline)
                    
                    ForEach(Array(zip(mealDetail.allIngredients, mealDetail.allMeasurements)), id: \.0) { ingredient, measurement in
                        Text("\(ingredient): \(measurement)")
                    }
                    
                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    Text(mealDetail.instructions)
                }
            }
            .padding()
        }
        .onAppear {
            if viewModel.mealDetail == nil {
                viewModel.fetchMealDetail(id: mealID)
            }
        }
        .navigationTitle("Meal Details")
    }
}
