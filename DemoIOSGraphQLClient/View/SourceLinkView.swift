//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/6/21.
//

import SwiftUI

struct SourceLinkView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content-Source")
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .environmentObject(AppState())
    }
}
