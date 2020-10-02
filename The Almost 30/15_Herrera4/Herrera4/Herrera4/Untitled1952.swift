//
//  Untitled1952.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

let bwStripes = generateStripes(color1:Color.black, color2:Color.white, bars:28)
let wbStripes = generateStripes(color1: .white, color2: .black, bars: 28)

struct Untitled1952: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                .frame(width: geometry.size.height/30)
                .foregroundColor(Color.black)
                VStack(spacing: 0) {
                    Rectangle()
                              .fill(LinearGradient(gradient: wbStripes, startPoint: .leading, endPoint: .trailing))
                    .frame(height: geometry.size.height/30)
                
                ZStack {
                    LinearGradient(gradient: wbStripes, startPoint: .leading, endPoint: .trailing)
                    InvertedTriangles()
                }
                    Rectangle()
                              .fill(LinearGradient(gradient: bwStripes, startPoint: .leading, endPoint: .trailing))
                    .frame(height: geometry.size.height/30)
                    
                }
                Rectangle()
                .frame(width: geometry.size.height/30)
                .foregroundColor(Color.white)
            }.frame(width:geometry.size.width, height: geometry.size.height)
                .border(Color.black, width: 1)
        }
    }
}


struct InvertedTriangles: View {
    let triangle1H:CGFloat = 0.65
    let triangle2H:CGFloat = 1.0
    
    var body: some View {
        Group {
            LinearGradient(gradient: bwStripes, startPoint: .leading, endPoint: .trailing).mask(
                HStack(alignment: .bottom, spacing: 0) {
                    IsoscelesTriangle(heightScalar: triangle1H)
                    IsoscelesTriangle(heightScalar: triangle2H)
            }.rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0)))
        }.shadow(color: Color.clear, radius: 0)
        
    }
}

struct IsoscelesTriangle: Shape {
    let yscalar:CGFloat
    
    init() {
        yscalar = 1
    }
    
    init(heightScalar ys:CGFloat) {
        yscalar = ys
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines([
                CGPoint(x: width/2, y: height * (CGFloat(1.0)-yscalar)),
                CGPoint(x: width, y: height),
                CGPoint(x: 0, y: height)
            ])
            path.closeSubpath()
        }
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

struct Untitled1952_Previews: PreviewProvider {
    static var previews: some View {
        Untitled1952().frame(width: 320, height: 300)
    }
}