//
//  SystemSoundStudio.swift
//  CallOfTheWild
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import AVFoundation

class SystemSoundStudio {
    private var keepPlayingFlag = true
    private var soundPlaying = true
    private var lastSystemSound:UInt32?
    
    // MARK: Start Playing
    
    func playSystemSound(soundID:UInt32) {
        lastSystemSound = soundID
        self.soundPlaying = true
        AudioServicesPlaySystemSound (soundID)
    }
    
    func playSystemSound(soundID: UInt32, todoAfter: @escaping (UInt32) -> Void) {
        lastSystemSound = soundID
        self.soundPlaying = true
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(soundID)) {
            todoAfter(soundID)
        }
    }
    
    // MARK: Stop Playing
    
    func onSoundCompletion(soundID:UInt32) {
        self.soundPlaying = false
    }
    
    func cleanUpSound(soundID:UInt32) {
        self.soundPlaying = false
        AudioServicesDisposeSystemSoundID(soundID)
    }
    
    func stopSystemSound() {
        AudioServicesDisposeSystemSoundID(lastSystemSound!)
    }
    
    // MARK: Loop Services
    
    func playSystemSoundLoop(soundID:UInt32) {
        playSystemSound(soundID: soundID, todoAfter: playCheck)
    }
  
    func playCheck(soundID:UInt32) {
        print("songDone")
        keepPlayingFlag ? playSystemSoundLoop(soundID: soundID) : cleanUpSound(soundID: soundID)
    }
    
    func stopLoop() {
         keepPlayingFlag = false
         stopSystemSound()
         print("keepPlayingFlag: \(keepPlayingFlag)")
     }

    // MARK: Loop Services
    
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
}
