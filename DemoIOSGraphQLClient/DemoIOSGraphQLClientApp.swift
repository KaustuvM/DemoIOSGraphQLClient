//
//  DemoIOSGraphQLClientApp.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/8/22.
//

import SwiftUI

@main
struct DemoIOSGraphQLClientApp: App {
    var appState = AppState()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .preferredColorScheme(.dark)
                .onAppear {
                    appState.fetchFruits()
                }
        }
    }
}
