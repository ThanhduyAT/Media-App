//
//  File.swift
//  DataRepositories
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import AudioPlayer
import SwiftData

public protocol AudioStorageInterface {
    func fetchAll() -> [AudioPersistent]
    func save(_ audio: AudioPersistent)
}

public class AudioStorage: AudioStorageInterface {
    private let context: ModelContext
    
    public init(context: ModelContext) {
        self.context = context
    }
    
    public func save(_ audio: AudioPersistent) {
        context.insert(audio)
    }
    
    public func fetchAll() -> [AudioPersistent] {
        let descriptor = FetchDescriptor<AudioPersistent>()
        return (try? context.fetch(descriptor)) ?? []
    }
}
