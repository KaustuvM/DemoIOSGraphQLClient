//
//  BackButtonView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/5/21.
//

import SwiftUI

struct BackButtonView: View {
    
    @EnvironmentObject var appState: AppState
    var index: Int
    
    var body: some View {
        Button(action: {
            appState.currentId = index
            appState.isHomeScreen = true
        }, label: {
            HStack(spacing: 8) {
                Image(systemName: "arrow.left.circle")
                    .imageScale(.large)
                Text("Back")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        })
            .accentColor(.white)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(index: 0)
            .environmentObject(AppState())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
