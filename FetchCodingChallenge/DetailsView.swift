//
//  DetailsView.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import SwiftUI

fileprivate enum Constants {
    static let title: String = "Instructions"
    static let titlePadding: CGFloat = 10
    
    static let imageWidth: CGFloat = 200
    static let imageHeight: CGFloat = 200
    static let imageCornerRadius: CGFloat = 8
    static let imagePadding: CGFloat = 10
    
    static let mainStackPadding: CGFloat = 20
    
    static let secondaryStackSpacing: CGFloat = 5
    static let secondaryStackPadding: CGFloat = 10
    static let secondTitle: String = "Ingredients"
    static let secondTitlePadding: CGFloat = 15
    
    static let testID: String = "52901"
}

struct DetailsView: View {
    @StateObject private var viewModel = ViewModel()
    @State var ingredients: [String] = []
    @State var measurements: [String] = []
    
    let mealID: String
    
    init(mealID: String) {
        self.mealID = mealID
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading) {
                
                VStack {
                    Text(Constants.title)
                        .padding([.bottom], Constants.titlePadding)
                        .font(.system(.title2))
                        .accessibilityHidden(true)
                    
                    AsyncImage(url: URL(string: viewModel.mealDetail?.strMealThumb ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                        
                    } placeholder: {
                        RoundedRectangle(cornerRadius: Constants.imageCornerRadius)
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    .cornerRadius(Constants.imageCornerRadius)
                    .padding(.bottom, Constants.imagePadding)
                    
                    Text(viewModel.mealDetail?.strInstructions ?? "")
                        .font(.system(.body))
                        .accessibilityHidden(true)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Instructions, \n \(viewModel.mealDetail?.strInstructions ?? "")")
                
                if viewModel.mealDetailIngredients.count != 0 {
                    VStack(alignment: .leading, spacing: Constants.secondaryStackSpacing) {
                        
                        Text(Constants.secondTitle)
                            .font(.system(.title2))
                            .padding(.bottom, Constants.secondTitlePadding)
                            .accessibilityLabel("Ingredients, there is a total of \(viewModel.mealDetailIngredients.count) ingredients")
                        
                        ForEach(0..<viewModel.mealDetailIngredients.count) { index in
                            Text("\(viewModel.mealDetailIngredients[index]): \(viewModel.mealDetailsMeasurements[index])")
                                .font(.system(.body))
                        }
                    }.padding(.top, Constants.secondaryStackPadding)
                    
                }
            }
            .padding([.leading, .trailing, .bottom],Constants.mainStackPadding)
            .navigationTitle(viewModel.mealDetail?.strMeal ?? "")
            .accessibilityHint("Dessert \(viewModel.mealDetail?.strMeal ?? "") details view")
            
            }
        }
        .onAppear {
            viewModel.fetchMealDetail(id: mealID)
            print("\n\n")
            print(viewModel.mealDetailIngredients.count)
            print("\n\n")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(mealID: Constants.testID)
    }
}
