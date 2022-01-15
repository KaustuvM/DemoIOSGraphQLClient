//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/5/21.
//

import SwiftUI

struct FruitDetailView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    FruitHeaderView(index: appState.currentId)
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(appState.fruitsData[appState.currentId].title)
                          .font(.largeTitle)
                          .fontWeight(.heavy)
                          .foregroundColor(appState.fruitsData[appState.currentId].gradientColors[1])
                        
                        
                        Text(appState.fruitsData[appState.currentId].headline)
                          .font(.headline)
                          .multilineTextAlignment(.leading)

                        
                        FruitNutrientsView(index: appState.currentId)
                        
                        Text("Learn more about \(appState.fruitsData[appState.currentId].title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(appState.fruitsData[appState.currentId].gradientColors[1])
                        
                        Text(appState.fruitsData[appState.currentId].description)
                            .multilineTextAlignment(.leading)
                        ForEach(0..<appState.fruitsData[appState.currentId].sectionHeaders.count) { index in
                            Text(appState.fruitsData[appState.currentId].sectionHeaders[index])
                            Text(appState.fruitsData[appState.currentId].sectionContents[index])
                                .multilineTextAlignment(.leading)
                        }
                        
                        BackButtonView(index: appState.currentId)
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
                .navigationBarTitle(appState.fruitsData[appState.currentId].title, displayMode: .inline)
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView()
            .environmentObject(AppState())
    }
}
