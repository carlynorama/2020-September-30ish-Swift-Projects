//
//  GoodByeSongHandler.swift
//  SongPlayer
//
//  Created by Carlyn Maw on 9/8/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation


class GoodByeSongHandler: ObservableObject {
    @Published private var handler:SongHandler = createGoodByeSongHandler()
    
    static func createGoodByeSongHandler() -> SongHandler {
        let songArray = [Song(filename: "So Hard To Say Goodbye", type: "m4a"),
        Song(filename: "Mushroom Picker Dance", type: "mp3")]
        var defaultSong = songArray[1]
        defaultSong.loadSongMeta()
        return SongHandler(song: defaultSong)
    }
    
    var isPlaying:Bool {
        handler.isPlaying
    }
    
    var currentSong:Song? {
        handler.currentSongInfo
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
