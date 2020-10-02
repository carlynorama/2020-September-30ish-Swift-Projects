//
//  AnimationGallery.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//
//https://www.hackingwithswift.com/books/ios-swiftui/animation-introduction
//https://www.hackingwithswift.com/books/ios-swiftui/creating-implicit-animations
//https://www.hackingwithswift.com/books/ios-swiftui/customizing-animations-in-swiftui
//https://www.hackingwithswift.com/books/ios-swiftui/creating-explicit-animations

import SwiftUI

struct AnimationGallery: View {
    @State private var spinAnimationAmount = 0.0
    @State private var growAnimationAmount:CGFloat = 1
    @State private var repeatingAnimationAmount:CGFloat = 1
    @State private var stepperAnimationAmount:CGFloat = 1
    @State private var enabled = false
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button("Spin") {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        self.spinAnimationAmount += 360
                        self.growAnimationAmount = 1
                        self.repeatingAnimationAmount = 1
                        self.stepperAnimationAmount = 1
                    }
                }.modifier(RedButtonStyle())
                    .rotation3DEffect(.degrees(spinAnimationAmount), axis: (x: 0, y: 1, z: 0))
                Button("Tap Me") {
                    self.enabled.toggle()
                }
                .frame(width: 100, height: 50)
                .background(enabled ? Color.blue : Color.red)
                .animation(.default)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                Button("Tap Me") {
                    self.enabled.toggle()
                }
                .frame(width: 100, height: 50)
                .background(enabled ? Color.blue : Color.red)
                .animation(nil)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1))
            }
            Spacer()
            HStack {
                Button("Grow") {
                    self.growAnimationAmount += 1
                }.modifier(RedButtonStyle())
                    .scaleEffect(growAnimationAmount)
                    .animation(.default)
                    .blur(radius: (growAnimationAmount - 1) * 3)
                
                Spacer()
                Button("Grow") {
                    self.growAnimationAmount += 1
                }.modifier(RedButtonStyle())
                    .scaleEffect(growAnimationAmount)
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .delay(1)
                )
                Spacer()
                Button("Grow") {
                    self.growAnimationAmount += 1
                }.modifier(RedButtonStyle())
                    .scaleEffect(growAnimationAmount)
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)
                )
            }
            Spacer()
            
            VStack {
                Divider()
                //Stepper("Scale amount", value: $stepperAnimationAmount.animation(), in: 1...10)
                Stepper("Scale amount", value: $stepperAnimationAmount.animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
                
                HStack {
                    Button("Tap Me") {
                        self.stepperAnimationAmount += 1
                    }
                    .modifier(RedButtonStyle())
                    .scaleEffect(stepperAnimationAmount)
                    Spacer()
                }
                Divider()
            }.padding()
            
            Spacer()
            HStack {
                //I don't really understand this one. Is it the going from 1(intializer) to 2(on appear?)
                Button("Pulse") {
                    self.repeatingAnimationAmount += 1
                }.modifier(RedButtonStyle())
                    .overlay(
                        Circle()
                            .stroke(Color.red)
                            .scaleEffect(repeatingAnimationAmount)
                            .opacity(Double(2 - repeatingAnimationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                        )
                )
                    .onAppear {
                        self.repeatingAnimationAmount = 2
                }
            }
            Spacer()
        }
    }
}

struct RedButtonStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(Font.custom("Avenir", size: 18))
            .padding(20)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct AnimationGallery_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGallery()
    }
}
