//
//  RotatingViewMine.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ArtView: View {
    var body: some View {
        Group {
            Image(systemName: "circle")
            Text("Name: Circ")
        }
    }
}

func aspectRatioFromSize(_ s:CGSize) -> CGFloat{
    s.width/s.height
}

func sizeIsHorizontal(_ s:CGSize) -> Bool {
    return aspectRatioFromSize(s) > 1
}

struct RotatingViewMine: View {
    @State private var horizaontalFlag:Bool = false
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                //Text("Hello!")
                if sizeIsHorizontal(geometry.size) {
                        HStack(content: ArtView.init)
                    } else {
                        VStack(content: ArtView.init)
                    }
            }
        }
    }
}



struct RotatingViewMine_Previews: PreviewProvider {
    static var previews: some View {
        RotatingViewMine()
    }
}
