//
//  PlayerView.swift
//  ToggleMeOut
//
//  Created by Labtanza on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    let song: Song
    @State private var isPlaying: Bool = false
    var body: some View {
        VStack {
            Text(song.title!).foregroundColor(isPlaying ? .primary : .secondary)
            Text(song.artist!).font(.caption).foregroundColor(.secondary)
            
            PlayButton(isPlaying: self.$isPlaying)
            
        }
    }
}

struct PlayButton: View {
    @Binding var isPlaying:Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
        
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(song: Song(title:"Take On Me", artist: "A-ha"))
    }
}
