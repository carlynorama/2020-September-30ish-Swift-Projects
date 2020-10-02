//
//  DragLetters.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

import SwiftUI

struct DragLetters: View {
       let letters = Array("Hello SwiftUI")
        @State private var enabled = false
        @State private var dragAmount = CGSize.zero

        var body: some View {
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in
                        self.dragAmount = .zero
                        self.enabled.toggle()
                    }
            )
        }
    }

struct DragLetters_Previews: PreviewProvider {
    static var previews: some View {
        DragLetters()
    }
}
