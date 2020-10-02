//
//  ContentView.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    
    
    
    @State private var isShowingRed = true
    @State private var isShowingBlue = true
    @State private var isShowingGreen = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    
                    Button("Tap Me") {
                        withAnimation {
                            self.isShowingRed.toggle()
                        }
                    }
                    
                    if isShowingRed {
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 100, height:100)
                            .transition(.scale)
                    }
                }
                Spacer()
                VStack {
                    Button("Tap Me") {
                        withAnimation {
                            self.isShowingBlue.toggle()
                        }
                    }
                    
                    if isShowingBlue {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 100, height:100)
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    }
                }
                Spacer()
                
                
            }
            
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        self.isShowingGreen.toggle()
                    }
                }
                
                if isShowingGreen {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 100, height:100)
                        .transition(.pivot)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
