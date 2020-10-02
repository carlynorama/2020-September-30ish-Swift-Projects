//
//  ContentView.swift
//  PlayMeOut
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var soundStudio = SoundStudio()
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.soundStudio.setM4A(name: "So Hard To Say Goodbye")
                self.soundStudio.playCurrentSong()
                self.isPlaying = true
            }) {
                
                HStack {
                    Text("Play me out")
                    Image(systemName: "play.fill")
                }
            }.disabled(isPlaying)
            Spacer()
            Button(action: {
                self.soundStudio.stopCurrentSong()
                self.isPlaying = false
            }) {
                HStack {
                    Text("Stop")
                    Image(systemName: "stop.fill")
                }
            }.disabled(!isPlaying)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
