//
//  ButtonStyles.swift
//  PlayMeOut
//
//  Created by Labtanza on 9/6/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SimpleButton:ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .padding(30)
                .contentShape(Rectangle())
                .background(
                    Group {
                        if configuration.isPressed {
                            SimpleButtonPressedBackground()
                        } else {
                            //SimpleButtonPressedBackground()
                            SimpleButtonBackground()
                        }
                    }
            )
            
        }
        
    }
}

struct SimpleButtonBackground: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.cardBackgroundColor)
            .shadow(color: Color.lowlightColor.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.highlightColor.opacity(0.7), radius: 10, x: -5, y: -5)
    }
    
}

struct SimpleButtonPressedBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.cardBackgroundColor)
            
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.midtoneColor, lineWidth: 4.0)
                    .blur(radius: 4)
                    .offset(x: 2, y:2)
                    .mask(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(Color.lowlightColor, Color.clear)))
        )
            
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 4.0)
                    .blur(radius: 4)
                    .offset(x: -2, y:-2)
                    .mask(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(Color.clear, Color.lowlightColor)))
        )
        
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                
            } else {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.lightEnd, Color.lightStart))
                    .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                
            } else {
                shape
                    .fill(Color.darkEnd)
                    .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkRoundedBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: 25))
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 25))
        )
            .foregroundColor(.white)
    }
}

struct DarkCircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkRoundedBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
            .foregroundColor(.white)
    }
}

struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
            .animation(nil)
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}


struct AllTheButtonsView: View {
    @State private var isToggled = false
    
    var body: some View {
        ZStack {
            //Color.backgroundColor
            LinearGradient(Color.darkStart, Color.darkEnd)
            HStack {
                VStack {
                    Spacer()
                    Button(action: {
                        print("help!")
                    }) {
                        Text("Hi This is longer!")
                    }.buttonStyle(SimpleButton())
                    Spacer()
                    Button(action: {
                        print("help!")
                    }) {
                        Text("Hi This is longer!")
                    }.buttonStyle(DarkButtonStyle())
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        print("help!")
                    }) {
                        Image(systemName: "heart.fill")
                    }.buttonStyle(DarkCircleButtonStyle())
                    Spacer()
                    Toggle(isOn: self.$isToggled) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(DarkToggleStyle())
                    Spacer()
                    Button(action: {
                        print("help!")
                    }) {
                        Image(systemName: "heart.fill")
                    }.buttonStyle(ColorfulButtonStyle())
                    Spacer()
                    Toggle(isOn: self.$isToggled) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(ColorfulToggleStyle())
                    Spacer()
                }
            }.padding()
        }.edgesIgnoringSafeArea(.all)
        
        
    }
    
}



struct ButtonStyles_Previews: PreviewProvider {
    
    static var previews: some View {
        AllTheButtonsView()
    }
}
