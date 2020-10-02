//
//  BlancoYVerde.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct BlancoYVerde: View {
    
    var body: some View {
        return ZStack {
            Rectangle().fill(Color.white)
            GeometryReader { geometry in
                Color.green.mask(IsoscelesTriangle()).frame(height:geometry.size.height/20)
                    .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(Color.gray), alignment: .bottom)
                    .position(x: geometry.size.width/2, y: geometry.size.height/3)
            }
        }
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

struct BlancoYVerde_Previews: PreviewProvider {
    static var previews: some View {
        BlancoYVerde()
            .frame(width:153.7*1.5, height: 173*1.5)
            .border(Color.black, width: 1)
    }
}
