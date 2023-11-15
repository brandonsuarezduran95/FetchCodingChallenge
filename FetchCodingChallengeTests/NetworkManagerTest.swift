//
//  NetworkManagerTest.swift
//  FetchCodingChallengeTests
//
//  Created by Brandon Suarez on 11/15/23.
//

import XCTest
@testable import FetchCodingChallenge

final class NetworkManagerTest: XCTestCase {
    let networkManager = NetworkManager()
    
    func testSuccesfullMealsDataFetched() {
        let expectation = XCTestExpectation(description: "Successful Meals Data NetworkCall")
        networkManager.fetchMealsData { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            default:
                break
            }
        }
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testSuccesfullMealDetailsDataFetched() {
        let testMealID: String = "52889"
        let expectation = XCTestExpectation(description: "Successful Meal Detail Data NetworkCall")
        networkManager.fetchMealDetails(with: testMealID) { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            default:
                break
            }
        }
        
        wait(for: [expectation], timeout: 0.5)
    }

}
