//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import Foundation


class NetworkManager {
    private let baseURL = "https://themealdb.com/api/json/v1/1"
    
    func fetchMeals(completion: @escaping (Result<[Meal], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/filter.php?c=Dessert") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 400, userInfo: nil)))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([String: [Meal]].self, from: data)
                if let meals = result["meals"] {
                    completion(.success(meals))
                } else {
                    completion(.failure(NSError(domain: "Invalid response", code: 400, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchMealDetail(id: String, completion: @escaping (Result<MealDetail, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/lookup.php?i=\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 400, userInfo: nil)))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([String: [MealDetail]].self, from: data)
                if let mealDetails = result["meals"]?.first {
                    completion(.success(mealDetails))
                } else {
                    completion(.failure(NSError(domain: "Invalid response", code: 400, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
