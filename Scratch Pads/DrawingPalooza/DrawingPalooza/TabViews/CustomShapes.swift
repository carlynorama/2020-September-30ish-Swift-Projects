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

struct Chevron: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            let arrowDepth:CGFloat = width * 0.8
            
            
            path.addLines([
                .zero,//CGPoint(x: 0, y: 0),
                CGPoint(x: arrowDepth, y: 0),
                CGPoint(x: width, y: height/2),
                CGPoint(x: arrowDepth, y: height),
                CGPoint(x: 0, y: height),
                CGPoint(x: width-arrowDepth, y: height/2)
            ])
            path.closeSubpath()
            
        }
    }
    
    
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.width * 0.25,
                                    y: rect.height * 0.25),
                    radius: rect.width * 0.25,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        
        let control1 = CGPoint(x: 0,
                               y: rect.height * 0.8)
        let control2 = CGPoint(x: rect.width * 0.50,
                               y: rect.height * 0.91)
        path.addCurve(to: CGPoint(x: rect.width * 0.5,
                                  y: rect.height),
                      control1: control1,
                      control2: control2)
        
        var transform = CGAffineTransform(translationX: rect.width, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
        path.addPath(path, transform: transform)
        
        return path
    }
}

struct IsoscelesTriangle: Shape {
    var yscalar:CGFloat = 1.0
    
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

struct Triangle: Shape {
    var scalarTop:CGFloat = 0.25
    var scalarTrailing:CGFloat = 0.25
    var scalarLeading:CGFloat = 0.25
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines([
                CGPoint(x: width*scalarTop, y: 0),
                CGPoint(x: width, y: height*scalarTrailing),
                CGPoint(x: 0, y: height*scalarLeading)
            ])
            path.closeSubpath()
        }
    }
}

struct RightTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines([
                CGPoint(x: width, y: 0),
                CGPoint(x: width, y: height),
                CGPoint(x: 0, y: height)
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
        return VStack(spacing:30) {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x:100, y:100))
            }.stroke(style: strokeStlye)


            
            Spacer()
            Chevron().stroke(style: strokeStlye)
            HStack {
                Diamond().stroke(style: strokeStlye)
                Heart().stroke(lineWidth: 10)
            }
            Spacer()
        }.padding()
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes()
    }
}
