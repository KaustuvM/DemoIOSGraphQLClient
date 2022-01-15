//
//  HomeView.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/5/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView(/*selection: $appState.currentId*/) {
            ForEach(0..<appState.fruitsData.count) { index in
                FruitCardView(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppState())
    }
}
