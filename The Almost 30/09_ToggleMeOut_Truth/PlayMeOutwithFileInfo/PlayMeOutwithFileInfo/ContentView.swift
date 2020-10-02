//
//  ContentView.swift
//  PlayMeOutwithFileInfo
//
//  Created by Labtanza on 9/8/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var songHandler:GoodByeSongHandler

    @State var isPlayingLocal = false
    //@State var currentSong:Song?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            //SongView(song: $goodbyeSong, isPlaying: $isPlaying)
            SongView(song: songHandler.currentSong, isPlaying: songHandler.isPlaying)
                .padding()
                .onTapGesture {
                    print("Tapped!")
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
        ContentView(songHandler: GoodByeSongHandler())
    }
}
