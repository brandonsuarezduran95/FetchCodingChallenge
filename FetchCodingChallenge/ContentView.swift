//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import SwiftUI

fileprivate enum Constants {
    static let title: String = "Desserts"
}

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        NavigationStack {
            if networkMonitor.isConnected == false {
                NoConnectionView()
            } else {
                MainView(meals: viewModel.meals)
            }
        }
        .onAppear {
            viewModel.fetchMealsData()
        }
    }
}

// MARK: - Main View
struct MainView: View {
    var meals: [Meals]
    
    init(meals: [Meals]) {
        self.meals = meals
    }
    var body: some View {
        List(meals, id: \.strMeal) { meal in
            NavigationLink {
                DetailsView(mealID: meal.idMeal)
            } label: {
                /*@START_MENU_TOKEN@*/Text(meal.strMeal)/*@END_MENU_TOKEN@*/
                    .font(.system(.body))
                    .accessibilityHint("Double Tap to view \(meal.strMeal)'s details")
            }
        }
        .navigationTitle(Constants.title)
        .accessibilityHint("List of Desserts View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
