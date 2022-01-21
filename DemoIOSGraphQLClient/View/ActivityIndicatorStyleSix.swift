//
//  ActivityIndicatorStyleSix.swift
//  SwiftUIReusableComponents
//
//  Created by Kaustuv Mukherjee on 1/8/22.
//

import SwiftUI

fileprivate var duration: CGFloat = 0.3
fileprivate var konst1 = 50.0
fileprivate var konst2 = 15.0
fileprivate var activityIndicatorWidth: CGFloat = UIScreen.main.bounds.width - konst1
fileprivate var progressBarWidth = activityIndicatorWidth - 4*konst1
fileprivate var height: CGFloat = 2.0
fileprivate var progress: CGFloat = 10

struct ActivityIndicatorStyleSix: View {
    var color_1: Color
    var color_2: Color
    
    @State var position: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    let timer = Timer.publish(every: duration, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "iphone")
                        .font(.system(size: konst1, weight: .bold))
                        .gradientForeground(colors: [color_1, color_2])
                    ZStack(alignment: .leading){
                        Rectangle()
                            .stroke(.gray.opacity(0.4), style: StrokeStyle(lineWidth: height))
                            .frame(height: height, alignment: .leading)
                        Rectangle()
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [color_2, color_1]),
                                startPoint: .leading,
                                endPoint: .trailing),
                                    style: StrokeStyle(lineWidth: height, lineCap: .round))
                            .frame(width: konst2, height: height, alignment: .leading)
                            .offset(x: position)
                            .animation(Animation.linear(duration: duration), value: position)
                        Rectangle()
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [color_1, color_2]),
                                startPoint: .leading,
                                endPoint: .trailing),
                                    style: StrokeStyle(lineWidth: height, lineCap: .round))
                            .frame(width: konst2, height: height, alignment: .trailing)
                            .offset(x: progressBarWidth - position - konst2)
                            .animation(Animation.linear(duration: duration), value: position)
                    }
                    .frame(width: progressBarWidth, alignment: .leading)
                    .onReceive(timer) { time in
                        if (position + konst2) < progressBarWidth {
                            if (position + konst2 + progress) > progressBarWidth {
                                position = progressBarWidth - konst2
                            } else {
                                position += progress
                            }
                        } else {
                            position = 0
                        }
                    }
                    Image(systemName: "desktopcomputer")
                        .font(.system(size: 48, weight: .bold))
                        .gradientForeground(colors: [color_1, color_2])
                }
                .frame(width: activityIndicatorWidth)
                
                Text("Download in progress...")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .fontWeight(.heavy)
                    .gradientForeground(colors: [color_1, color_2])
            }
        }
        .padding(.top, 40)
        .onAppear() {
            self.isAnimating = true
        }
    }
}

struct ActivityIndicatorStyleSix_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorStyleSix(color_1: Color("Dark_7"), color_2: Color("Light_7"))
    }
}
