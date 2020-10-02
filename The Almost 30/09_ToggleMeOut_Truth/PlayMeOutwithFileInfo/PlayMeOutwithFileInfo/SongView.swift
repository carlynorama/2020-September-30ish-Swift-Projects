//
//  SongView.swift
//  SongPlayer
//
//  Created by Carlyn Maw on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SongView: View {
    //@Binding var song:Song?
    var song:Song?
    var isPlaying:Bool
    
    func SongImageView() -> Image {
        guard let img = song?.image else {
            return Image("bluenote").resizable()
            //return Image(systemName: "speaker.3.fill").resizable()
        }
        return Image(uiImage: img).resizable()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            if song == nil {
                Text("No song loaded")
            } else {
                SongImageView().scaledToFit()
                Text(song!.title ?? song!.filename).multilineTextAlignment(.center)
                Text("Artist: \((song?.artist) ?? "No Data")")
                    .opacity((song?.artist != nil) ? 1 : 0)
                    .font(.caption)
                Text("Album: \((song?.artist) ?? "No Data")")
                    .opacity((song?.artist != nil) ? 1 : 0)
                    .font(.caption)
            }
            
        }
        .contentShape(Rectangle())
        .foregroundColor(isPlaying ? .primary : .secondary)
    }
}

//struct SongView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongView(song: ContentView.$song, isPlaying: ContentView.$isPlaying)
//    }
//}
