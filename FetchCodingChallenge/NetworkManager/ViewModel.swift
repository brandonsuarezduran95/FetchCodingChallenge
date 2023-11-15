//
//  Router.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    
    fileprivate let networkManager: NetworkManager = NetworkManager()
    
    @Published var meals: [Meals] = []
    @Published var mealDetail: MealDetail? = nil
    
    @Published var mealDetailIngredients: [String] = []
    @Published var mealDetailsMeasurements: [String] = []

    func fetchMealsData() {
        networkManager.fetchMealsData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [unowned self] in
                    let sortedData = data.meals.sorted()
                    meals = sortedData
                    print(meals)
                }
            case .failure(let error):
                print("Meals: \(error.rawValue)")
            }
        }
    }
    
    func fetchMealDetail(id: String) {
        networkManager.fetchMealDetails(with: id) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [unowned self] in
                    mealDetail = data.meals.first
                    mealDetailIngredients = getIngredients(detailsSource: data.meals.first)
                    mealDetailsMeasurements = getMeasurements(detailsSource: data.meals.first)
                    print(data.meals)
                    print("\n\n\n")
                    print(mealDetailIngredients)
                    print("\n\n\n")
                    print(mealDetailsMeasurements)
                    print("\n\n\n")
                }
            case .failure(let error):
                print("Details: \(error.rawValue)")
            }
        }
    }
    
    func getIngredients(detailsSource: MealDetail? ) -> [String] {
        guard let detailsSource else { return [""] }
        
        let ingredient1 = (detailsSource.strIngredient1 ?? "")
        let ingredient2 = (detailsSource.strIngredient2 ?? "")
        let ingredient3 = (detailsSource.strIngredient3 ?? "")
        let ingredient4 = (detailsSource.strIngredient4 ?? "")
        let ingredient5 = (detailsSource.strIngredient5 ?? "")
        let ingredient6 = (detailsSource.strIngredient6 ?? "")
        let ingredient7 = (detailsSource.strIngredient7 ?? "")
        let ingredient8 = (detailsSource.strIngredient8 ?? "")
        let ingredient9 = (detailsSource.strIngredient9 ?? "")
        let ingredient10 = (detailsSource.strIngredient10 ?? "")
        let ingredient11 = (detailsSource.strIngredient11 ?? "")
        let ingredient12 = (detailsSource.strIngredient12 ?? "")
        let ingredient13 = (detailsSource.strIngredient13 ?? "")
        let ingredient14 = (detailsSource.strIngredient14 ?? "")
        let ingredient15 = (detailsSource.strIngredient15 ?? "")
        let ingredient16 = (detailsSource.strIngredient16 ?? "")
        let ingredient17 = (detailsSource.strIngredient17 ?? "")
        let ingredient18 = (detailsSource.strIngredient18 ?? "")
        let ingredient19 = (detailsSource.strIngredient19 ?? "")
        let ingredient20 = (detailsSource.strIngredient20 ?? "")
    
        let ingredients: [String] = [
            ingredient1,
            ingredient2,
            ingredient3,
            ingredient4,
            ingredient5,
            ingredient6,
            ingredient7,
            ingredient8,
            ingredient8,
            ingredient9,
            ingredient10,
            ingredient11,
            ingredient12,
            ingredient13,
            ingredient14,
            ingredient15,
            ingredient16,
            ingredient17,
            ingredient18,
            ingredient19,
            ingredient20,
        ].filter { ingredient in
            if (ingredient == " " || ingredient == "") {
                return false
            } else {
                return true
            }
        }
        
        return ingredients
    }
    
    func getMeasurements(detailsSource: MealDetail?) -> [String] {
        guard let detailsSource else { return [""] }
    
        let measure1 = (detailsSource.strMeasure1 ?? "")
        let measure2 = (detailsSource.strMeasure2 ?? "")
        let measure3 = (detailsSource.strMeasure3 ?? "")
        let measure4 = (detailsSource.strMeasure4 ?? "")
        let measure5 = (detailsSource.strMeasure5 ?? "")
        let measure6 = (detailsSource.strMeasure6 ?? "")
        let measure7 = (detailsSource.strMeasure7 ?? "")
        let measure8 = (detailsSource.strMeasure8 ?? "")
        let measure9 = (detailsSource.strMeasure9 ?? "")
        let measure10 = (detailsSource.strMeasure10 ?? "")
        let measure11 = (detailsSource.strMeasure11 ?? "")
        let measure12 = (detailsSource.strMeasure12 ?? "")
        let measure13 = (detailsSource.strMeasure13 ?? "")
        let measure14 = (detailsSource.strMeasure14 ?? "")
        let measure15 = (detailsSource.strMeasure15 ?? "")
        let measure16 = (detailsSource.strMeasure16 ?? "")
        let measure17 = (detailsSource.strMeasure17 ?? "")
        let measure18 = (detailsSource.strMeasure18 ?? "")
        let measure19 = (detailsSource.strMeasure19 ?? "")
        let measure20 = (detailsSource.strMeasure20 ?? "")
    
        let measurements: [String] = [
            measure1,
            measure2,
            measure3,
            measure4,
            measure5,
            measure6,
            measure7,
            measure8,
            measure8,
            measure9,
            measure10,
            measure11,
            measure12,
            measure13,
            measure14,
            measure15,
            measure16,
            measure17,
            measure18,
            measure19,
            measure20,
        ].filter { measurement in
            if (measurement == " " || measurement == "") {
                return false
            } else {
                return true
            }
        }
        
        return measurements
    }
}
