//
//  SongView.swift
//  Metros
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SongView: View {
    var song:Song
    var isSelected:Bool
    var isPlaying:Bool
    var playFunction:() -> ()
    var stopFunction:() -> ()
    
    var body: some View {
        HStack {
            SongMetaView(song: song, isSelected: isSelected)
            Spacer()
            PlayStopButton(
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

//struct SongView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongView(
//            song: Song(filename: "So Hard To Say Goodbye", type: "m4a"),
//            isSelected: false,
//            selectFunction: s
//    }
//}