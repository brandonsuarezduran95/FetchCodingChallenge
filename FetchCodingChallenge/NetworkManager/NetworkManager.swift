//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import Foundation

fileprivate enum EndPoint {
    static let mealsEndPoint: String = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let mealsDetailsEndPoint: String = "https://themealdb.com/api/json/v1/1/lookup.php?i="
}

final class NetworkManager {
    
    func fetchMealsData(completion: @escaping (Result<MeaLModel, NetworkError>) -> Void) {
        guard let url = URL(string: EndPoint.mealsEndPoint) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.badServerResponse))
            }
            
            do {
                let result = try JSONDecoder().decode(MeaLModel.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.badParsing))
            }
        }.resume()
    }
    
    func fetchMealDetails(with id: String, completion: @escaping(Result<MealDetailsModel, NetworkError>) -> Void) {
        let endPoint: String = EndPoint.mealsDetailsEndPoint + id
        guard let url = URL(string: endPoint) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.badServerResponse))
            }
            
            do {
                let result = try JSONDecoder().decode(MealDetailsModel.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.badParsing))
            }
            
        }.resume()
    }
    
}

