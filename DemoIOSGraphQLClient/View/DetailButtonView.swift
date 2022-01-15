//
//  DetailButtonView.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/5/22.
//

import SwiftUI

struct DetailButtonView: View {
    @EnvironmentObject var appState: AppState
    var index: Int
    
    var body: some View {
        Button(action: {
            appState.currentId = index
            appState.isHomeScreen = false
        }, label: {
            HStack(spacing: 8) {
                Text("Details")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
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

struct DetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtonView(index: 0)
            .environmentObject(AppState())
    }
}
