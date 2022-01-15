//
//  FruitCardView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/5/21.
//

import SwiftUI

struct FruitCardView: View {
    
    @EnvironmentObject var appState: AppState
    var index: Int
    @State var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
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
                    ActivityIndicatorStyleFive(color_1: appState.fruitsData[index].gradientColors[0],
                                               color_2: appState.fruitsData[index].gradientColors[1])
                }
                
                Text(appState.fruitsData[index].title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                Text(appState.fruitsData[index].headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                DetailButtonView(index: index)
            }
        }
        .onDisappear() {
            isAnimating = false
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: appState.fruitsData[index].gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(index: 0)
            .environmentObject(AppState())
    }
}
