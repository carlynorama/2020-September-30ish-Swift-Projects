//
//  PlayStopButtons.swift
//  ButtonPalooza
//
//  NON TOGGLE TYPLES!
//  Created by Carlyn Maw on 9/12/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

//class MetroSongHandler: ObservableObject {
//@Published private var handler:SongHandler = createMetroSongHandler()
//
//static func createMetroSongHandler() -> SongHandler {
//    var introSong = Song(filename: "Mushroom Picker Dance", type: "mp3")
//    var goodByeSong = Song(filename: "So Hard To Say Goodbye", type: "m4a")
//    introSong.loadSongMeta()
//    goodByeSong.loadSongMeta()
//    let songArray = [introSong, goodByeSong]
//    return SongHandler(songArray)
//}
//    //etc...
//}

struct PlayStopButtons: View {
    //In the original all of these functions and variables pointed to an observed class.
    //@ObservedObject var songHandler:MetroSongHandler
    @State private var isPlaying = false
    @State private var isSelcted = false
    @State var currentSong:String? = "Pretend Song"
    var song2 = "Song B"
    var song1 = "Song A"
    
    private func play() {
        print("play")
        self.isPlaying.toggle()
    }
    
    private func stop() {
        print("stop")
        self.isPlaying.toggle()
    }
    
    private func songIsPlaying(_ song:String) -> Bool {
        self.isPlaying && song == currentSong
    }

// This is going to act weird because they are not meant to be on the same screen.
    var body: some View {
        VStack {
            Group {
                Text("Button at top level: ")
                SongView(
                    song: song2,
                    isSelected: song2 == currentSong
                ).onTapGesture {
                    self.isPlaying.toggle()
                }
                .frame(height: 100)
                PlayStopButton(
                    isPlaying: self.isPlaying,
                    playFunction: self.play,
                    stopFunction: self.stop
                ).frame(width: 100, height: 100)
                //.disabled(!isSelected)
            }
            Group {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Button in Subview: ").font(.title)
                    SongView2(
                        song: song1,
                        isSelected: song1 == currentSong,
                        isPlaying: songIsPlaying(song1),
                        playFunction: self.play,
                        stopFunction: self.stop
                    ).onTapGesture {
                        //Song selction only. Has nothing to do with play pause. 
                        self.currentSong = (self.song1 == self.currentSong) ? self.song2 : self.song1
                    }
                    .frame(height: 100)
                }
                
            }
            
        }
    }
}




struct SongView: View {
    var song:String //wasn't really a string was a type Song
    var isSelected:Bool
    
    var body: some View {
        HStack {
            Text(song)  //Reminder: in subview was .onAppear(perform: self.song?.loadSongMeta())
                .contentShape(Rectangle())
                .foregroundColor(isSelected ? .primary : .secondary)
        }.contentShape(Rectangle())
    }
}

struct PlayStopButton: View {
    var isPlaying:Bool
    var playFunction:() -> ()
    var stopFunction:() -> ()
    
    var body: some View {
        Button(action: {
            self.isPlaying ? self.stopFunction() : self.playFunction()
        }) {
            Image(systemName: isPlaying ? "stop.circle" : "play.circle")
                .resizable()
        }
    }
}

struct SongView2: View {
    var song:String?
    var isSelected:Bool
    var isPlaying:Bool
    var playFunction:() -> ()
    var stopFunction:() -> ()
    
    var body: some View {
        HStack {
            SongMetaView2(song: song, isSelected: isSelected)
            Spacer()
            PlayStopButton2(
                isPlaying: isPlaying,
                playFunction: playFunction,
                stopFunction: stopFunction
            )
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isSelected ? .primary : .secondary)
            .disabled(!isSelected)
        }.contentShape(Rectangle())
    }
}




struct PlayStopButton2: View {
    var isPlaying:Bool
    var playFunction:() -> ()
    var stopFunction:() -> ()
    
    var body: some View {
        Button(action: {
            self.isPlaying ? self.stopFunction() : self.playFunction()
        }) {
            Image(systemName: isPlaying ? "stop.circle" : "play.circle")
                .resizable()
        }
        
    }
}

struct SongMetaView2: View {
    //@Binding var song:Song?
    var song:String?
    var isSelected:Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if song == nil {
                Text("No song loaded")
            } else {
                Image(systemName: "circle").scaledToFit()
                    .opacity((isSelected) ? 1 : 0.5)
                VStack(alignment: .leading) {
                    Text("Song: \((song) ?? "No Data")")
                        .opacity((song != nil) ? 1 : 0)
                        .font(.caption)
                }
                
            }
            
        }
        .contentShape(Rectangle())
        .foregroundColor(isSelected ? .primary : .secondary)
        //.onAppear(perform: self.song?.loadSongMeta())
        
    }
}



struct PlayStopButtons_Previews: PreviewProvider {
    static var previews: some View {
        PlayStopButtons()
    }
}
