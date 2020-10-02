//
//  ContentView.swift
//  WhatDayIsIt
//
//  Created by Labtanza on 8/25/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
import Foundation

var dayString:String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
    return (dateFormatter.string(from: Date())) // "Tue, Mar 20, 2018" for en-US locale
}

struct ContentView: View {
    var body: some View {
        Text(dayString).font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
