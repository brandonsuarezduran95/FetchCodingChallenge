//
//  FetchCodingChallengeApp.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/11/23.
//

import SwiftUI

@main
struct FetchCodingChallengeApp: App {
    @State private var showLaunchView: Bool = true
    let mainView: some View = ContentView()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                mainView.opacity(0.0)
                if showLaunchView {
                    LaunchView(showLaunchView: $showLaunchView)
                        .transition(.move(edge: .leading))
                } else {
                    mainView.opacity(1.0)
                }
            }
        }
    }
}
