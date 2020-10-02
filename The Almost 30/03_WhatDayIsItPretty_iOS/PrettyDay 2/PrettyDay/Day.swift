//
//  Day.swift
//  PrettyDay
//
//  Created by Carlyn Maw on 8/31/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import SwiftUI

struct Day {
    @State var date = Date()
    
    var dateString:String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        //formatter.timeStyle = .full
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    var dayAbrvString:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: date)
    }
    
    var dayIndex:Int {
        Calendar.current.component(.weekday, from: date)-1 //calendar returns a number 1-7, vs 0-6
    }
    
    func getAbrvFromIndex(whichDay:Int) -> String {
        let formatter = DateFormatter()
        let weekdays = formatter.shortWeekdaySymbols //also veryShort
        return weekdays![whichDay]
    }
    
    func getDayNameFromIndex(whichDay:Int) -> String {
        let formatter = DateFormatter()
        let weekdays = formatter.weekdaySymbols //also veryShort
        return weekdays![whichDay]
    }
    
    func getVeryShortNameFromIndex(whichDay:Int) -> String {
        let formatter = DateFormatter()
        let weekdays = formatter.veryShortWeekdaySymbols //also veryShort
        return weekdays![whichDay]
    }

}
