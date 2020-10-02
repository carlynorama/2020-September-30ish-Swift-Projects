//
//  ContentView.swift
//  CHerrera_DetailView1
//
//  Created by Carlyn Maw on 9/16/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var whichImage:Int = 0
    
    var body: some View {
        VStack {
            WorkDetailView(work: worksArray[whichImage])
            Button(action: {
                if self.whichImage < worksArray.count-1 {
                    self.whichImage = self.whichImage + 1
                } else {
                    self.whichImage = 0
                }
            }) {
            Text("Next")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
