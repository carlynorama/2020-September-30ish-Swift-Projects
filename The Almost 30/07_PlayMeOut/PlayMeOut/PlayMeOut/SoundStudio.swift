//
//  SoundStudio.swift
//  Play Me Out
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer!

class SoundStudio {
    private var currentFileURL: URL? = nil
    
    // MARK: Song Meta
    
    func setSong(name:String, kind:String) {
        if let tryPath = Bundle.main.path(forResource: name, ofType: "\(kind)") {
            currentFileURL = URL(fileURLWithPath: tryPath)
        } else {
            currentFileURL = nil
            print("Song not found")
        }
    }
    
    func setM4A(name:String) {
        setSong(name: name, kind: "m4a")
    }
    
    func setMP3(name:String) {
        setSong(name: name, kind: "mp3")
    }

    func duration(for resource: String) -> Double {
        let asset = AVURLAsset(url: URL(fileURLWithPath: resource))
        return Double(CMTimeGetSeconds(asset.duration))
    }
    
    func duration() -> Double {
        let asset = AVURLAsset(url: currentFileURL!)
        return Double(CMTimeGetSeconds(asset.duration))
    }
    
    // MARK: Start Playing
    
    func playCurrentSong() {
        if let songPath = self.currentFileURL?.path, FileManager().fileExists(atPath: songPath) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: self.currentFileURL!)
                guard let player = audioPlayer else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("The file doesn not exist at path || may not have been downloaded yet")
        }
        
    }
    
    // MARK: Stop Playing
    
    func stopCurrentSong() {
        guard let player = audioPlayer else { return }
        player.stop()
    }
    
    // MARK: Loop Services
    
    
}
