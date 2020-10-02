//
//  GradientParade.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

let rainbow:[Color] = [.red, .orange, .yellow, .green, .blue, .purple]

struct GradientParade: View {
    let myGradient = generateStripes(color1: .red, color2: .black, bars: 7)
    let rainbowGradient = generateStripes(colors: rainbow, sets: 4)
    let rainbowGradient2 = generateStripes(colors: rainbow, bars: 19)
    var body: some View {
        Rectangle().fill(LinearGradient(gradient: rainbowGradient2, startPoint: .top, endPoint: .bottom))
    }
}

func generateStripes(color1:Color, color2:Color, bars:Int) -> Gradient{
    var stops = [Gradient.Stop]()
    
    for i in 0 ..< bars {
        let spaceing:CGFloat = 1/CGFloat(bars)
        //print("spacing: \(spaceing)")
        let barcolor:Color = i.isMultiple(of: 2) ? color1 : color2
        stops.append(.init(color: barcolor, location: CGFloat(spaceing * CGFloat(i))))
        stops.append(.init(color: barcolor, location: CGFloat(spaceing * CGFloat(i+1))))
    }
    print(stops)
    return Gradient(stops: stops)
    
}

func generateStripes(colors:[Color], sets:Int) -> Gradient{
    let spaceing:CGFloat = CGFloat(CGFloat(1)/(CGFloat(colors.count)*CGFloat(sets)))
    print("spacing: \(spaceing)")
    var stops = [Gradient.Stop]()
    for s in 0..<sets {
        let offset:CGFloat = CGFloat(s) * (CGFloat(colors.count)*spaceing)
        for i in 0 ..< colors.count {
            stops.append(.init(color: colors[i], location: CGFloat(spaceing * CGFloat(i))+offset))
            stops.append(.init(color: colors[i], location: CGFloat(spaceing * CGFloat(i+1))+offset))
        }
    }
    print(stops)
    return Gradient(stops: stops)
    
}

func generateStripes(colors:[Color], bars:Int) -> Gradient{
    let spaceing:CGFloat = 1/CGFloat(bars)
    let sets:Int = Int(ceil(Double(bars)/Double(colors.count)))
    var barCount:Int = 0
    print("spacing: \(spaceing)")
    var stops = [Gradient.Stop]()
    
    
    outer: for s in 0..<sets {
        let offset:CGFloat = CGFloat(s) * (CGFloat(colors.count)*spaceing)
        inner: for i in 0 ..< colors.count {
            let barStart:CGFloat = CGFloat((spaceing * CGFloat(i)) + offset)
            let barStop:CGFloat = CGFloat((spaceing * CGFloat(i+1)) + offset)
            if (barStop > 1.0) || (barStart > 1.0) {
                break outer
            }
            stops.append(.init(color: colors[i], location: barStart))
            stops.append(.init(color: colors[i], location: barStop))
            barCount += barCount
        }
    }
    print(stops)
    return Gradient(stops: stops)
    
}




struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        GradientParade()
    }
}
