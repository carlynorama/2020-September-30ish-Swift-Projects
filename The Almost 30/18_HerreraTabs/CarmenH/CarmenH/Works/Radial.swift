//
//  Radial.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI


var radialGradient:Gradient {
    let stops: [Gradient.Stop] = [
        .init(color: .red, location: 0.03),
        .init(color: .blue, location: 0.03),
        .init(color: .blue, location: 0.25),
        .init(color: .red, location: 0.25),
        .init(color: .red, location: 0.26),
        .init(color: .blue, location: 0.26),
        .init(color: .blue, location: 0.48),
        .init(color: .red, location: 0.48),
        .init(color: .red, location: 0.5),
        .init(color: .blue, location: 0.5),
        .init(color: .blue, location: 0.645),
        .init(color: .red, location: 0.645),
        .init(color: .red, location: 0.655),
        .init(color: .blue, location: 0.655),
        .init(color: .blue, location: 0.885),
        .init(color: .red, location: 0.90),
        .init(color: .red, location: 0.90),
        .init(color: .blue, location: 0.90),
        .init(color: .blue, location: 1)]
    return Gradient(stops: stops)
}

struct Radial: View {
    let radialCenter:UnitPoint = UnitPoint(x: (UnitPoint.center.x + 0.115), y: UnitPoint.center.y - 0.15)
    var body: some View {
        AngularGradient(gradient: radialGradient, center: radialCenter)
    }
}

struct Radial_Previews: PreviewProvider {
    static var previews: some View {
        Radial().frame(width:200, height: 300)
    }
}
