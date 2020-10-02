//
//  Ting.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation

struct Ting {
    var date:Date
}

extension Ting {
    init?(from canidateString:String, withFormat:String = "yyyy-MM-dd'T'HH:mm:ssZ") {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        print("trying to find a ting with format \(withFormat)")
        guard let foundDate = dateFormatter.date(from: canidateString) else {
            return nil
        }
        date = foundDate
    }
}

