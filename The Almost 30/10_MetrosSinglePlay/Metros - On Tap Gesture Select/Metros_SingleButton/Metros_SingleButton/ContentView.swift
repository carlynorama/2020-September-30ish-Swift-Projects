//
//  ContentView.swift
//  Metros
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var songHandler:MetroSongHandler
    
    var introSelected:Bool {
        songHandler.currentSong == songHandler.songArray[0]
    }
    
    var outroSelected:Bool {
        !introSelected
    }
    
    func swapSong(_ newSong: Song) {
        var keepPlaying = false
        if songHandler.isPlaying {
            keepPlaying = true
            songHandler.stopCurrentSong()
        }
        songHandler.setSong(newSong)
        
        if keepPlaying {
            songHandler.playCurrentSong()
        }
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Play me in: ")
                SongView(
                    song: songHandler.songArray[0],
                    isSelected: introSelected
                ).onTapGesture {
                    self.swapSong(self.songHandler.songArray[0])
                }
                .frame(height: 100)
                Spacer()
                Text("Play me out: ")
                SongView(
                    song: songHandler.songArray[1],
                    isSelected: outroSelected
                )
                    .onTapGesture {
                        self.swapSong(self.songHandler.songArray[1])
                }
                .frame(height: 100)
                Spacer()
            }
            Spacer()
            PlayStopButton(
                isPlaying: songHandler.isPlaying,
                playFunction: songHandler.playCurrentSong,
                stopFunction: songHandler.stopCurrentSong
            ).frame(width: 100, height: 100)
            Spacer()
            
        }.padding(50)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(songHandler: MetroSongHandler())
    }
}
