//
//  ContentView.swift
//  ToggleMeOut
//
//  Created by Labtanza on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var soundStudio = SoundStudio()
    @State private var isPlaying = false
    
    func playSong() {
        self.soundStudio.setM4A(name: "So Hard To Say Goodbye")
        self.soundStudio.playCurrentSong()
        self.isPlaying = true
    }
    
    func stopSong() {
        self.soundStudio.stopCurrentSong()
        self.isPlaying = false
    }
    
    var body: some View {

        VStack {
            Spacer()

  
            Group {
                if isPlaying {
                    Button(action: {
                        self.stopSong()
                    }) {
                        HStack {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                        }
                    }
                } else {
                    Button(action: {
                        self.playSong()
                    }) {
                        
                        HStack {
                            Text("Play me out")
                            Image(systemName: "play.fill")
                        }
                    }
                }
                
            }
            Spacer()
            Toggle(isOn: $isPlaying) {
                Text("Sound")
            }
            .toggleStyle(AudioToggleStyle())
            
//            .onTapGesture {
//                    if self.isPlaying {
//                        print("stopTest")
//                    } else {
//                        print("playtest")
//                    }
//            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
