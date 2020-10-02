//
//  Rondo.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI


var rondoGradient:Gradient {
    let stops: [Gradient.Stop] = [
        .init(color: .yellow, location: 0.5),
        .init(color: .blue, location: 0.5)]
    return Gradient(stops: stops)
}

struct Rondo: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: rondoGradient, startPoint: .top, endPoint: .bottom)
                    .overlay(
                        RondoOverlay()
                    )
            }.frame(width: min(geometry.size.width, geometry.size.height), height: min(geometry.size.width, geometry.size.height))
                .clipShape(Circle())
        }
    }
}

struct RondoOverlay:View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Diamond()
                    .fill(LinearGradient(gradient: rondoGradient, startPoint: .bottom, endPoint: .top))
                Diamond()
                    .fill(LinearGradient(gradient: rondoGradient, startPoint: .top, endPoint: .bottom))
                    .frame(width:geometry.size.width/20, height: geometry.size.height)
                
            }
        }
    }
    
}

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

struct Rondo_Previews: PreviewProvider {
    static var previews: some View {
        Rondo()
    }
}

//struct Rondo: View {
//    let width:CGFloat = 200
//    let height:CGFloat = 200
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(LinearGradient(gradient: rondoGradient, startPoint: .top, endPoint: .bottom))
//                .overlay(
//                    Diamond().fill(LinearGradient(gradient: rondoGradient, startPoint: .bottom, endPoint: .top)
//                    )
//            ).frame(width:width, height: height )
//            Diamond()
//            .fill(LinearGradient(gradient: rondoGradient, startPoint: .top, endPoint: .bottom))
//                .frame(width:width/15, height: height)
//        }.padding()
//    }
//}
//
