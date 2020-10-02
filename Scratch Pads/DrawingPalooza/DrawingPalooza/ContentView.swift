//
//  ContentView.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            RotatingView1()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            RotatingViewMine()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            ColorPlay()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("third")
                        Text("Third")
                    }
                }
                .tag(2)
            CustomShapes()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("fourth")
                        Text("Fourth")
                    }
                }
                .tag(3)
            GradientParade()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("fourth")
                        Text("Fifth")
                    }
                }
                .tag(4)
            GeometryReaderPractice()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("fourth")
                        Text("Sixth")
                    }
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.dark)
            ContentView().colorScheme(.light)
        }
    }
}
