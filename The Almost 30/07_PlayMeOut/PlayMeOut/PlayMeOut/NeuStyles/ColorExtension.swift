//
//  ColorExtension.swift
//  PlayMeOut
//
//  Created by Labtanza on 9/6/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension Color {
    
    static let backgroundColor:Color = .brokenWhite
    static let cardBackgroundColor:Color = .backgroundColor
    static let highlightColor:Color = .white
    static let midtoneColor:Color = .gray
    static let lowlightColor:Color = .black
    static let textColor:Color = .darkGray
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let baseWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let blueWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let brokenWhite: Color = Color(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0)
    
    static let darkGray = Color(red: 57.0 / 255.0, green: 62.0 / 255.0, blue: 70.0 / 255.0)
    
}

