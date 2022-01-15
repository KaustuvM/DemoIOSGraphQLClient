//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/6/21.
//

import SwiftUI

struct FruitHeaderView: View {
    
    @EnvironmentObject var appState: AppState
    var index: Int
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: appState.fruitsData[index].gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            if appState.imageStates[appState.fruitsData[index].id]?.loadingStatus == .success {
                appState.imageStates[appState.fruitsData[index].id]!.image!
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.1)
                    .onAppear() {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isAnimating = true
                        }
                    }
            } else {
                ActivityIndicatorStyleFive(color_1: appState.fruitsData[index].gradientColors[0].opacity(0.5),
                                           color_2: appState.fruitsData[index].gradientColors[1].opacity(0.5))
            }
        }
        .frame(height: 440)
        .onDisappear() {
            isAnimating = false
        }
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        FruitHeaderView(index: 0)
            .environmentObject(AppState())
    }
}
