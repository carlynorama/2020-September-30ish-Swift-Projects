//
//  CardView.swift
//  PrettyDay
//
//  Created by Carlyn Maw on 8/31/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var isCurrentDay:Bool = false
    var label = "L"
    
    var body: some View {
        ZStack {
            if isCurrentDay {
                Circle()
                    .fill(Color.accentColor)
                Text(label).font(.headline)
                    .foregroundColor(.background)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.clear)
                Text(label)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

        }.frame(height: 50.0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isCurrentDay: false)
    }
}
