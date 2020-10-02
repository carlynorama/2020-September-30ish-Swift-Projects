//
//  MoreGeometryReader.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct MoreGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 20) {
                Text("Left")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.yellow)
                Text("Right")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.orange)
            }
        }
//        VStack {
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9, height: 40)
//                    .background(Color.red)
//            }.background(Color.green)
//
//            Text("More text")
//                .background(Color.blue)
//        }
    }
}

struct MoreGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MoreGeometryReader()
    }
}
