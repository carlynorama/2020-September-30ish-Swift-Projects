//
//  Song.swift
//  SongPlayer
//
//  Created by Carlyn Maw on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

struct Song: Equatable {
    let filename:String
    let type:String
    
    var title:String?
    var artist:String?
    var album:String?
    var image:UIImage?
    
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.getfileURL() == rhs.getfileURL() && lhs.getfileURL() != nil
    }
    
    func getfileURL() -> URL? {
        if let tryPath = Bundle.main.path(forResource: filename, ofType: "\(type)") {
            return URL(fileURLWithPath: tryPath)
        } else {
            print("Song not found")
            return nil
        }
    }
    
    //    mutating func getTitle() -> String {
    //        if self.title != nil {
    //            return self.title!
    //        } else {
    //            self.getSongMeta()
    //            if self.title != nil {
    //                return self.title!
    //            }
    //        }
    //        return "No title data"
    //    }
    //
    //    mutating func getArtist() -> String {
    //        if self.artist != nil {
    //            return self.artist!
    //        } else {
    //            self.getSongMeta()
    //            if self.artist != nil {
    //                return self.artist!
    //            }
    //        }
    //        return "No artist data"
    //    }
    //
    //    mutating func getAlbum() -> String {
    //        if self.album != nil {
    //            return self.album!
    //        } else {
    //            self.getSongMeta()
    //            if self.album != nil {
    //                return self.album!
    //            }
    //        }
    //        return "No album data"
    //    }
    
    //private mutating func getSongMeta() {
    mutating func loadSongMeta() {
        if let songPath = self.getfileURL()?.path, FileManager().fileExists(atPath: songPath) {
            if let url = self.getfileURL() {
                let songAsset = AVURLAsset.init(url: url)
                for metadataFormat in songAsset.availableMetadataFormats {
                    for metadataItem in songAsset.metadata(forFormat: metadataFormat){
                        if metadataItem.commonKey?.rawValue == "title",let title = metadataItem.value as? String {
                            self.title = title
                        }else if metadataItem.commonKey?.rawValue == "artist",let artist = metadataItem.value as? String {
                            self.artist = artist
                        }else if metadataItem.commonKey?.rawValue == "albumName",let album = metadataItem.value as? String {
                            self.album = album
                        }else if metadataItem.commonKey?.rawValue == "artwork",let imageData  = metadataItem.value as? Data{
                            print("image found")
                            self.image = UIImage.init(data: imageData)!
                            
                        }
                    }
                }
            } else {
                print("could not retrieve URL")
            }
        } else {
            print("The file doesn not exist at path")
        }
    }
}
