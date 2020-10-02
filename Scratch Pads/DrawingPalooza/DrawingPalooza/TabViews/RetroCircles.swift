//
//  RetroCircles.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct RetroCircles: View {
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            Circle()
                .inset(by: -30)
                .stroke(lineWidth: 20)
                .opacity(0.4)
                .foregroundColor(.blue)
                .background(Circle().foregroundColor(.green))
        }
    }
}

struct RetroCircles_Previews: PreviewProvider {
    static var previews: some View {
        RetroCircles()
    }
}
