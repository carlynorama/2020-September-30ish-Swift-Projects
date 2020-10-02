//
//  ContentView.swift
//  PrettyDay
//
//  Created by Carlyn Maw on 8/31/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    let currentDay = Day()
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            //Text("\(currentDay.dateString)")
            HStack(alignment: .center) {
                ForEach(0..<7) { index in
                    CardView(
                        isCurrentDay: (index==self.currentDay.dayIndex),
                        label: self.currentDay.getVeryShortNameFromIndex(whichDay: index)
                    ).padding(.leastNonzeroMagnitude)
                }
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
