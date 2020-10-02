//
//  SoundStudio.swift
//  Play Me Out
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import AVFoundation
var sPlayer: AVAudioPlayer!




struct SongHandler {
    private var currentSong: Song? = nil
    private var songArray = [Song]()
    
    init(song:Song) {
        setSong(song)
    }
    
    init(_ songArray: [Song]) {
        self.songArray = songArray
        setSong(songArray[0])
    }
    
    init() {
        currentSong = nil
    }
    
    
    var isPlaying:Bool = false
    
    // MARK: Song Meta
    
    var currentSongInfo:Song? {
        self.currentSong
    }
    
    var getSongArray:[Song] {
        songArray
    }
    
    mutating func setSong(name:String, type:String) {
        //objectWillChange.send()
        let songToTest  = Song(filename: name, type: type)
        if (songToTest.getfileURL() != nil) {
            currentSong = songToTest
            currentSong!.loadSongMeta()
        } else {
            currentSong = nil
            print("No file at that location")
        }

    }
    
    mutating func setSong(_ song:Song) {
        setSong(name: song.filename, type: song.type)
    }
    
    mutating func setM4A(name:String) {
        setSong(name: name, type: "m4a")
    }
    
    mutating func setMP3(name:String) {
        setSong(name: name, type: "mp3")
    }

    private func duration(for resource: String) -> Double {
        let asset = AVURLAsset(url: URL(fileURLWithPath: resource))
        return Double(CMTimeGetSeconds(asset.duration))
    }
    
    private func duration() -> Double {
        let asset = AVURLAsset(url: (currentSong?.getfileURL()!)!)
        return Double(CMTimeGetSeconds(asset.duration))
    }
    
    // MARK: Start Playing
    
    mutating func playCurrentSong() {
        if let songPath = self.currentSong?.getfileURL()?.path, FileManager().fileExists(atPath: songPath) {
            do {
                sPlayer = try AVAudioPlayer(contentsOf: (self.currentSong?.getfileURL())!)
                guard let player = sPlayer else { return }
                
                player.prepareToPlay()
                player.play()
                self.isPlaying = player.isPlaying
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("The file doesn not exist at path || may not have been downloaded yet")
        }
        
    }
    
    // MARK: Stop Playing
    
    mutating func stopCurrentSong() {
        guard let player = sPlayer else { return }
        player.stop()
        self.isPlaying = player.isPlaying
    }
    
    // MARK: Loop Services

    
}
