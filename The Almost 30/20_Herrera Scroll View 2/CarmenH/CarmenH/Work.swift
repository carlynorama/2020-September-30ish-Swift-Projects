//
//  Work.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import SwiftUI

struct Size {
    let widthCM: Double
    let heightCM: Double
    
    var ratio:CGFloat {
        CGFloat(widthCM)/CGFloat(heightCM)
    }
    
    init(w:Double, h:Double) {
        widthCM = w
        heightCM = h
    }

    init(widthInInches:Double, heightInIncehes:Double) {
        widthCM = widthInInches * 2.54
        heightCM = heightInIncehes * 2.54
    }
}

struct Work: Equatable, Identifiable {
    
    static func == (lhs: Work, rhs: Work) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    let artist:String = "Carmen Herrera"
    let title:String
    let size:Size
    let representation:AnyView
    let year:String?
    let medium: String?
    let collection:String?
    let referenceURL:String?

}
