//
//  CardDrag.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

import SwiftUI

struct CardDrag: View {
    @State private var dragAmount1 = CGSize.zero
     @State private var dragAmount2 = CGSize.zero
    
    var body: some View {
        VStack {
            Spacer()
            Text("Spring on both movements")
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 200, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount1)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount1 = $0.translation }
                            .onEnded { _ in self.dragAmount1 = .zero }
            ).animation(.spring())
            Spacer()
            Text("Spring attached to onEnded only")
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 200, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount2)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount2 = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.dragAmount2 = .zero
                                }
                            }
            )
            Spacer()
        }
    }
}

struct CardDrag_Previews: PreviewProvider {
    static var previews: some View {
        CardDrag()
    }
}
