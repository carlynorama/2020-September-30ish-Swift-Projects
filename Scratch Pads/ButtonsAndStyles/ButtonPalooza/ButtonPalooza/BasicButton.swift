//
//  ButtonsStylesModifiers.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ButtonsStylesModifiers: View {
    @State private var rememberMe = false
    @State private var disableFlag = false
    @State private var animationAmount:CGFloat = 1
    
    func firstAction() {
        print("first")
    }
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            //action passed as function declaration with view expanded
            Button(action: self.firstAction) {
                Text("System Button")
            }
            
            Divider()
            
            
            VStack(alignment: .center, spacing: 20) {
                //action passed as function declaration
                Button("Filled Button Style 1") {
                    self.firstAction()
                }.buttonStyle(FilledButtonStyle1())  //Text and button together
                
                Button(action: {
                    self.firstAction()
                }) {
                    Text("Filled Button Style 2")
                }
                    .buttonStyle(FilledButtonStyle2()) // has button info only
                    .modifier(ButtonTextStyle()) // contols font, foreground color is still in button style
                
                Button(action: {
                    self.firstAction()
                }) {
                    Text("View Modifier")
                }.modifier(FilledButtonModifier()) // Button as a modifier, calls text modifier
                
                
            }
            
            Divider()
            
            
            HStack {
                // Boolean toggle written from scratch
                PushButton(title: "Remember Me", isOn: $rememberMe).disabled(disableFlag)
                Text(rememberMe ? "On" : "Off")
                
                //https://www.hackingwithswift.com/books/ios-swiftui/creating-implicit-animations
                Button("Grow") {
                    self.animationAmount += 1
                }
                .padding(50)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(.default)
                .blur(radius: (animationAmount - 1) * 3)
            }
            
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

//MARK: Button Styles

struct FilledButtonStyle1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.accentColor)
            .font(Font.custom("Avenir", size: 18))
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}



struct FilledButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
            .shadow(color: Color.orange, radius: 5, x: 1, y: 1)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct ButtonTextStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(Font.custom("Avenir", size: 18))
        
    }
}

struct FilledButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        let shadowX:CGFloat = 2
        let shadowY:CGFloat =  2
        return content
            .foregroundColor(Color.blue)
            .padding(.all, 15)  // padding has to go before background to padd text
            .padding(.trailing, shadowX) // padding is additive
            .padding(.bottom, shadowY)
            .background(Color.white)
            .cornerRadius(40)
            .padding(.all, 5)
            .modifier(LabelStyle())
            .shadow(color: Color.orange, radius: 5, x: shadowX, y: shadowY)
        
    }
}

struct LabelStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 1, x: 1, y: 1)
            .font(Font.custom("Avenir", size: 18))
        
    }
}




struct TextButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .orange : Color.accentColor)
            .padding()
            .cornerRadius(8)
    }
}





//Ray Wenderlich
struct AppStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Color.purple)
            .accentColor(Color(red: 253.0/255.0, green: 187.0/255.0, blue: 69.0/255.0))
    }
}


struct ValueStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.accentColor)
            .modifier(LabelStyle())
    }
}



struct TextStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Avenir", size: 40))
        
    }
}


struct ContainerStyle : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 250)
            .background(Color.white)
            .cornerRadius(5)
            .padding(.all, 20)
            .shadow(color: Color.gray, radius: 0.5, x: 0.5, y: 0.5)
    }
}



struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsStylesModifiers()
    }
}
