//
//  ColorPlay.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
//"Pink" is in the asset catalog

let color = Color(red: 1, green: 0, blue: 0)

let colorUI = Color(UIColor(red: 1, green: 0, blue: 0, alpha: 1))

let colorHSV = Color(hue: 1, saturation: 1, brightness: 1, opacity: 1)

let colorCS = Color(.sRGB, red: 1, green: 0, blue: 0, opacity: 1)

var gradient:Gradient {
    let colors: [Color] = [.red, .green,.blue]
    return Gradient(colors: colors)
}

var stopsGradient:Gradient {
    let stops: [Gradient.Stop] = [
        .init(color: .red, location: 0.6),
        .init(color: .blue, location: 0.65)]
    return Gradient(stops: stops)
}



struct ColorPlay: View {
    var body: some View {
                ZStack {
            Color("Pink").edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack {
                            Rectangle().fill(color)
                            Rectangle().fill(colorUI)
                            Rectangle().fill(colorHSV)
                            Rectangle().fill(colorCS)
                            
                        }
                                
                        HStack {
                            Rectangle().fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
                            Rectangle().fill(LinearGradient(gradient: stopsGradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                            Rectangle().fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                            Rectangle().fill(LinearGradient(gradient: gradient, startPoint: .center, endPoint: .bottom))
                            
                        }
                        HStack {
                            Rectangle().fill(RadialGradient(gradient: gradient, center: .center, startRadius: 10, endRadius: 50))
                            Rectangle().fill(RadialGradient(gradient: gradient, center: .top, startRadius: 25, endRadius: 150))
                            Rectangle().fill(RadialGradient(gradient: stopsGradient, center: .top, startRadius: 25, endRadius: 150))
                            Rectangle().strokeBorder(RadialGradient(gradient: gradient, center: .leading, startRadius: 25, endRadius: 150), lineWidth: 20)
                            
                        }
                        
                        HStack {
                            Rectangle().fill(AngularGradient(gradient: gradient, center: .center))
                            Rectangle().fill(AngularGradient(gradient: gradient, center: .top))
                            Rectangle().fill(AngularGradient(gradient: gradient, center: .bottom))
                            Rectangle().fill(AngularGradient(gradient: stopsGradient, center: .center))
                            
                        }
                    }.padding()

        }
    }
}

struct ColorPlay_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorPlay().colorScheme(.light)
            ColorPlay().colorScheme(.dark)
        }
    }
}
