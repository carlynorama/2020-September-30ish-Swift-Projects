//
//  CustomShapes.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
        
            path.addLines([
                CGPoint(x: width/2, y: 0),
            CGPoint(x: width, y: height/2),
            CGPoint(x: width/2, y: height),
            CGPoint(x: 0, y: height/2)
            ])
            path.closeSubpath()
        }
    }
}

struct CustomShapes: View {
    var body: some View {
        let strokeStlye = StrokeStyle(
            lineWidth: 10,
            lineCap: .round,
            lineJoin: .round,
            //miterLimit: 0.5,
            dash: [50, 20, 10, 20],
            dashPhase: 30)
       return VStack {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x:200, y:200))
            
        }.stroke(style: strokeStlye)
        Diamond().stroke(style: strokeStlye)
        }.padding()
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes()
    }
}
