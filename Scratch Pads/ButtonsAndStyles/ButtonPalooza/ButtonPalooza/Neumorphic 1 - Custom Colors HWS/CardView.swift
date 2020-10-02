//
//  CardView.swift
//  PlayMeOut
//
//  Created by Labtanza on 9/6/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    let backgroundColor:Color = .brokenWhite
    let cardBackgroundColor:Color = .blueWhite
    let highlightColor:Color = .white
    let lowlightColor:Color = .black
    let textColor:Color = .darkGray
    
    var body: some View {
        ZStack {
            self.backgroundColor
            RoundedRectangle(cornerRadius: 25)
                .fill(self.cardBackgroundColor)
                .frame(width: 300, height: 300, alignment: .top)
                .shadow(color: self.lowlightColor.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: self.highlightColor.opacity(0.7), radius: 10, x: -5, y: -5)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(self.textColor)
        .edgesIgnoringSafeArea(.all)
    }
   
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
