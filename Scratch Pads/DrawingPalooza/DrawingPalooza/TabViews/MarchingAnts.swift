//
//  MarchingAnts.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct MarchingAnts: View {
    @State private var phase: CGFloat = 0
    var body: some View {
                   Rectangle()
        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
        .frame(width: 200, height: 200)
        .onAppear { self.phase -= 20 }
        .animation(Animation.linear.repeatForever(autoreverses: false))
    }
}

struct MarchingAnts_Previews: PreviewProvider {
    static var previews: some View {
        MarchingAnts()
    }
}
