//
//  ButtonModifiers.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.accentColor)
            .font(Font.custom("Avenir", size: 18))
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
