//
//  SongView.swift
//  SongPlayer
//
//  Created by Carlyn Maw on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SongMetaView: View {
    //@Binding var song:Song?
    var song:Song?
    var isSelected:Bool
    
    func SongImageView() -> Image {
        guard let img = song?.image else {
            return Image("blue_note").resizable()
            //return Image(systemName: "speaker.3.fill").resizable()
        }
        return Image(uiImage: img).resizable()
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if song == nil {
                SongImageView().scaledToFit()
                Text("No song loaded")
            } else {
                SongImageView().scaledToFit()
                    .opacity((isSelected) ? 1 : 0.5)
                VStack(alignment: .leading) {
                    Text(song!.title ?? song!.filename).multilineTextAlignment(.leading)
                    Text("Artist: \((song?.artist) ?? "No Data")")
                        .opacity((song?.artist != nil) ? 1 : 0)
                        .font(.caption)
                    Text("Album: \((song?.artist) ?? "No Data")")
                        .opacity((song?.artist != nil) ? 1 : 0)
                        .font(.caption)
                }
                
            }
            
        }
        .contentShape(Rectangle())
        .foregroundColor(isSelected ? .primary : .secondary)
        //.onAppear(perform: self.song?.loadSongMeta())
        
    }
}

//struct SongView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongView(song: ContentView.$song, isPlaying: ContentView.$isPlaying)
//    }
//}

struct SongMetaView_Previews: PreviewProvider {
    static var previews: some View {
        SongMetaView(song: Song(filename: "So Hard To Say Goodbye", type: "m4a"), isSelected: true)
    }
}
