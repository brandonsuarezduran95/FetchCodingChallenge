//
//  LaunchView.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/14/23.
//

import SwiftUI

fileprivate enum Constants {
    static let loadingMessage: String = "Fetching Data..."
    static let timerLoop: Double = 0.1
    static let horizontalStackSpacing: CGFloat = 3
    
    static let characterStartPosition: CGFloat = 0
    static let characterYOffset: CGFloat = -10
}

struct LaunchView: View {
    
    @State private var fetchingData: [String] = Constants.loadingMessage.map { String($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish (every: Constants.timerLoop, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            if showLoadingText {
                HStack(spacing: Constants.horizontalStackSpacing) {
                    ForEach(fetchingData.indices) { index in
                        Text(fetchingData[index])
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .offset(y: counter == index ? Constants.characterYOffset : Constants.characterStartPosition)
                    }
                }
                .transition(AnyTransition.scale.animation(.easeIn))
            }
        }
        .accessibilityLabel("Fetching Data, please wait")
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = fetchingData.count - 1
                
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 3 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
