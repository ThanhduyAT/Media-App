//
//  File.swift
//  Presentation
//
//  Created by Duy Thanh on 1/3/25.
//

import Foundation
import AudioDomain

struct AudioModel: Identifiable, Sendable, Equatable {
    public let id: String
    public let duration: Double
    public let url: String
    public let title: String
    public let artist: String
    
    init(audio: Audio) {
        self.id = audio.id
        self.duration = audio.duration
        self.url = audio.url
        self.title = audio.title
        self.artist = audio.artist
    }
    
    init(id: String, duration: Double, url: String, title: String, artist: String) {
        self.id = id
        self.duration = duration
        self.url = url
        self.title = title
        self.artist = artist
    }
}
