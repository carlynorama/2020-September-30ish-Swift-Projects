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

struct BlancoYVerde_Previews: PreviewProvider {
    static var previews: some View {
        BlancoYVerde()
            .frame(width:153.7*1.5, height: 173*1.5)
            .border(Color.black, width: 1)
    }
}