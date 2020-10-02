//
//  GradientParade.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct GradientParade: View {
    let myGradient = generateColorBars(color1: .red, color2: .black, numberOfBars: 7)
    var body: some View {
        Rectangle().fill(LinearGradient(gradient: myGradient, startPoint: .top, endPoint: .bottom))
    }
}

func generateColorBars(color1:Color, color2:Color, numberOfBars:Int) -> Gradient{
    var stops = [Gradient.Stop]()
    
    for i in 0 ... numberOfBars {
        let spaceing = 1/numberOfBars
        let barcolor:Color = i.isMultiple(of: 2) ? color2 : color1
        stops.append(.init(color: barcolor, location: CGFloat(spaceing * i)))
        stops.append(.init(color: barcolor, location: CGFloat(spaceing * i+1)))
    }
    print(stops)
    return Gradient(stops: stops)
    
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        GradientParade()
    }
}
