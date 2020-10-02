//
//  untitled2017.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct untitled2017: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle().fill(Color.black)
                Rectangle()
                    .fill(Color.red)
                    .offset(y: (-1 * (geometry.size.height)/1.9))
                    .rotation3DEffect(.degrees(40), axis: (x: 1, y: 0, z: 0))
            }
        }
        .clipShape(Rectangle())
    }
}

struct untitled2017_Previews: PreviewProvider {
    static var previews: some View {
        untitled2017().frame(width:69.9*5, height:49.5*5)
    }
}
