//
//  File.swift
//  Domain
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation

public struct Audio: Identifiable, Equatable {
    public let id: String
    public let duration: Double
    public let url: String
    public let title: String
    public let artist: String
    
    public init(id: String, duration: Double, url: String, title: String, artist: String) {
        self.id = id
        self.duration = duration
        self.url = url
        self.title = title
        self.artist = artist
    }
}
