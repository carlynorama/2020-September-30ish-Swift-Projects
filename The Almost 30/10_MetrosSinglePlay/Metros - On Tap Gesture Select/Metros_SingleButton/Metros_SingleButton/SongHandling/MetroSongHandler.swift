//
//  MetroSongHandler.swift
//  SongPlayer
//
//  Created by Carlyn Maw on 9/8/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation


class MetroSongHandler: ObservableObject {
    @Published private var handler:SongHandler = createMetroSongHandler()
    
    static func createMetroSongHandler() -> SongHandler {
        var introSong = Song(filename: "Mushroom Picker Dance", type: "mp3")
        var goodByeSong = Song(filename: "So Hard To Say Goodbye", type: "m4a")
        introSong.loadSongMeta()
        goodByeSong.loadSongMeta()
        let songArray = [introSong, goodByeSong]
        return SongHandler(songArray)
    }
    
    var isPlaying:Bool {
        handler.isPlaying
    }
    
    var currentSong:Song? {
        handler.currentSongInfo
    }
    
    var songArray:[Song] {
        handler.getSongArray
    }
    
    
    func playCurrentSong() {
        handler.playCurrentSong()
    }
    
    func stopCurrentSong() {
        handler.stopCurrentSong()
    }
    
    func setSong(_ song: Song) {
        handler.setSong(song)
    }
}
