//
//  File.swift
//  DataRepositories
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import SwiftData
import AudioDomain

@Model
public final class AudioPersistent {
    public var id: String
    public var duration: Double
    public var url: String
    public var title: String
    public var artist: String
    
//    public init(audio: Audio) {
//        self.id = audio.id
//        self.duration = audio.duration
//        self.url = audio.url
//        self.title = audio.title
//        self.artist = audio.artist
//    }
    
    public init(id: String, duration: Double, url: String, title: String, artist: String) {
        self.id = id
        self.duration = duration
        self.url = url
        self.title = title
        self.artist = artist
    }

}
