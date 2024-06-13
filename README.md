# RecipeApp

## Project Overview
RecipeApp is a native iOS application built using SwiftUI and the MVVM architecture. It allows users to browse recipes from TheMealDB API. The app fetches a list of meals in the Dessert category and displays details of each meal including the name, instructions, ingredients, and measurements.

## Features
- Display a list of dessert meals sorted alphabetically.
- View detailed information about a selected meal.
- Cache images to reduce network usage and improve performance.





## Models

### Meal.swift
Represents a meal with basic details. Conforms to `Identifiable` and `Codable` protocols.

- **Properties:**
  - `id`: The unique identifier of the meal.
  - `name`: The name of the meal.
  - `thumbnail`: The URL of the meal's thumbnail image.

### MealDetail.swift
Represents detailed information about a meal. Conforms to `Codable` protocol.

- **Properties:**
  - `id`: The unique identifier of the meal.
  - `name`: The name of the meal.
  - `instructions`: The instructions for preparing the meal.
  - `thumbnail`: The URL of the meal's thumbnail image.
  - `strIngredient1` to `strIngredient20`: Optional strings representing ingredients.
  - `strMeasure1` to `strMeasure20`: Optional strings representing measurements.

- **Computed Properties:**
  - `allIngredients`: Combines all ingredients into a single array, excluding empty values.
  - `allMeasurements`: Combines all measurements into a single array, excluding empty values.

## ViewModels

### MealListViewModel.swift
ViewModel for managing the list of meals. Fetches meals from the API and handles loading and error states.

- **Properties:**
  - `meals`: The list of meals.
  - `isLoading`: Indicates whether the data is being loaded.
  - `errorMessage`: Stores any error messages.

- **Functions:**
  - `fetchMeals()`: Fetches the list of meals from the API. Updates `meals`, `isLoading`, and `errorMessage` properties based on the result.

### MealDetailViewModel.swift
ViewModel for managing the details of a specific meal. Fetches meal details from the API and handles loading and error states.

- **Properties:**
  - `mealDetail`: The detailed information about a meal.
  - `isLoading`: Indicates whether the data is being loaded.
  - `errorMessage`: Stores any error messages.

- **Functions:**
  - `fetchMealDetail(id: String)`: Fetches the details of a specific meal by its ID. Updates `mealDetail`, `isLoading`, and `errorMessage` properties based on the result.

## Views

### MealListView.swift
View for displaying the list of meals.

- **Properties:**
  - `viewModel`: The ViewModel for managing meal list data.

### MealDetailView.swift
View for displaying the details of a specific meal.

- **Properties:**
  - `viewModel`: The ViewModel for managing meal detail data.
  - `mealID`: The ID of the meal to display details for.

## Utilities

### ImageCache.swift
A simple image cache using NSCache.

- **Properties:**
  - `shared`: Singleton instance of the image cache.
  - `cache

# RecipeApp

## Project Overview
RecipeApp is a native iOS application built using SwiftUI and the MVVM architecture. It allows users to browse recipes from TheMealDB API. The app fetches a list of meals in the Dessert category and displays details of each meal including the name, instructions, ingredients, and measurements.

## Features
- Display a list of dessert meals sorted alphabetically.
- View detailed information about a selected meal.
- Cache images to reduce network usage and improve performance.




## Models

### Meal.swift
Represents a meal with basic details. Conforms to `Identifiable` and `Codable` protocols.

- **Properties:**
  - `id`: The unique identifier of the meal.
  - `name`: The name of the meal.
  - `thumbnail`: The URL of the meal's thumbnail image.

### MealDetail.swift
Represents detailed information about a meal. Conforms to `Codable` protocol.

- **Properties:**
  - `id`: The unique identifier of the meal.
  - `name`: The name of the meal.
  - `instructions`: The instructions for preparing the meal.
  - `thumbnail`: The URL of the meal's thumbnail image.
  - `strIngredient1` to `strIngredient20`: Optional strings representing ingredients.
  - `strMeasure1` to `strMeasure20`: Optional strings representing measurements.

- **Computed Properties:**
  - `allIngredients`: Combines all ingredients into a single array, excluding empty values.
  - `allMeasurements`: Combines all measurements into a single array, excluding empty values.

## ViewModels

### MealListViewModel.swift
ViewModel for managing the list of meals. Fetches meals from the API and handles loading and error states.

- **Properties:**
  - `meals`: The list of meals.
  - `isLoading`: Indicates whether the data is being loaded.
  - `errorMessage`: Stores any error messages.

- **Functions:**
  - `fetchMeals()`: Fetches the list of meals from the API. Updates `meals`, `isLoading`, and `errorMessage` properties based on the result.

### MealDetailViewModel.swift
ViewModel for managing the details of a specific meal. Fetches meal details from the API and handles loading and error states.

- **Properties:**
  - `mealDetail`: The detailed information about a meal.
  - `isLoading`: Indicates whether the data is being loaded.
  - `errorMessage`: Stores any error messages.

- **Functions:**
  - `fetchMealDetail(id: String)`: Fetches the details of a specific meal by its ID. Updates `mealDetail`, `isLoading`, and `errorMessage` properties based on the result.

## Views

### MealListView.swift
View for displaying the list of meals.

- **Properties:**
  - `viewModel`: The ViewModel for managing meal list data.

### MealDetailView.swift
View for displaying the details of a specific meal.

- **Properties:**
  - `viewModel`: The ViewModel for managing meal detail data.
  - `mealID`: The ID of the meal to display details for.

## Utilities

### ImageCache.swift
A simple image cache using NSCache.

- **Properties:**
  - `shared`: Singleton instance of the image cache.
  - `cache`: The underlying NSCache instance.

- **Functions:**
  - `getImage(forKey key: String) -> UIImage?`: Retrieves an image from the cache.
    - **Parameters:**
      - `key`: The key for the cached image.
    - **Returns:** The cached image, or `nil` if no image is cached for the key.
  - `setImage(_ image: UIImage, forKey key: String)`: Stores an image in the cache.
    - **Parameters:**
      - `image`: The image to cache.
      - `key`: The key for the cached image.

