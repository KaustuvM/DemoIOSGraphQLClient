//
//  RootView.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/5/22.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.loadingStatus {
        case .success:
            if appState.isHomeScreen {
                HomeView()
            } else {
                FruitDetailView()
            }
        case .none:
            ActivityIndicatorStyleSix(color_1: .gray.opacity(0.9), color_2: .gray.opacity(0.5))
        case .failure:
            VStack {
                Text("Loading failed!")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                Text("Check if server is up and running...")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
            }
        case .notFound:
            Text("Data not found...")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.secondary)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(AppState())
    }
}
