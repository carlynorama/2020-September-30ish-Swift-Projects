//
//  TingHistoryView.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct TingHistoryView: View {
   var tingLog = TingLog()
   //var tings = (TingLog().loadTings())!
    
   var tings = (TingLog().loadTings()) ??  ([
       Ting(date: Date()),
       Ting(date: Date(timeIntervalSinceNow: -3600)),
       Ting(date: Date(timeIntervalSinceNow: -7200))
   ])
        
        
        var body: some View {
            List(tings, id: \.date) { ting in
                TingRow(ting: ting)
            }.navigationBarTitle("History")
    }
}
struct TingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TingHistoryView()
    }
}
