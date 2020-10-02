//
//  ContentView.swift
//  CallOfTheWild
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var soundStudio = SystemSoundStudio()
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.soundStudio.playSystemSoundLoop(soundID: 1330)
            }) {
                Text("hear the call")
            }
            Spacer()
            Button(action: {
                self.soundStudio.stopLoop()
            }) {
                Text("stop")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
