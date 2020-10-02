//
//  ImageCircle.swift
//  DrawingPalooza
//
//  Created by Carlyn Maw on 9/13/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ImageCircle: View {
    var body: some View {
        ZStack {
            Color("Pink").edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("birds")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .border(Color.white, width:8)
                    .frame(width: 250)
                
                Image("birds")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(lineWidth: 8)
                        .foregroundColor(.white))
                    .frame(width: 250)
            }
        }
    }
}


struct ImageCircle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageCircle().colorScheme(.light)
            ImageCircle().colorScheme(.dark)
        }
    }
}
