//
//  TingRow.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct TingRow: View {
    var ting: Ting
    
    var body: some View {
        Text("\(ting.date)")
    }
}

struct TingRow_Previews: PreviewProvider {
    static var previews: some View {
        TingRow(ting: Ting(date: Date()))
    }
}
