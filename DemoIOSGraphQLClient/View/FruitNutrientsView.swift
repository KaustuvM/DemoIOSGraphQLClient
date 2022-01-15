//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/6/21.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    @EnvironmentObject var appState: AppState
    var index: Int
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var body: some View {
        GroupBox() {
            
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(appState.fruitsData[index].gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(appState.fruitsData[index].nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(index: 0)
            .environmentObject(AppState())
    }
}
