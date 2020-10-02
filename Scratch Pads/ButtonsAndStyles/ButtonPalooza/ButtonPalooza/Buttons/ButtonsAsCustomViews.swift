//
//  ButtonsAsCustomViews.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/11/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ButtonsAsCustomViews: View {
    @State private var rememberMe = false
    @State private var disableFlag = false
    
    var body: some View {
        VStack {
                        // Boolean toggle written from scratch
        PushButton(title: "Remember Me", isOn: $rememberMe).disabled(disableFlag)
        Text(rememberMe ? "On" : "Off")
        }
    }
}

//MARK: Button behavior as returned view
//Hacking with swift: https://www.hackingwithswift.com/books/ios-swiftui/creating-a-custom-component-with-binding
struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct PushButton2: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ButtonsAsCustomViews_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsAsCustomViews()
    }
}
