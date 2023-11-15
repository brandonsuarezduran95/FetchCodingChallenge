//
//  MealModel.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import Foundation

struct MeaLModel: Codable, Hashable {
    let meals: [Meals]
}

struct Meals: Codable, Hashable, Comparable {
    
    static func < (lhs: Meals, rhs: Meals) -> Bool {
        if lhs.strMeal < rhs.strMeal {
            return true
        } else {
            return false
        }
    }
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
