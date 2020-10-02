//
//  PlayStopButton.swift
//  PlayMeOutwithFileInfo
//
//  Created by Labtanza on 9/9/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

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

struct PlayStopButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayStopButton(isPlaying: true, playFunction: {print("try to play")}, stopFunction: {print("try to stop")})
    }
}
