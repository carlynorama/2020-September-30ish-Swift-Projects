//
//  Extensions.swift
//  PrettyDay
//
//  Created by Carlyn Maw on 8/31/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import SwiftUI

public extension Color {
    #if os(macOS)
    static let background = Color(NSColor.windowBackgroundColor)
    static let secondaryBackground = Color(NSColor.underPageBackgroundColor)
    static let tertiaryBackground = Color(NSColor.controlBackgroundColor)
    #else
    static let background = Color(UIColor.systemBackground)
    static let secondaryBackground = Color(UIColor.secondarySystemBackground)
    static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
    #endif
}
