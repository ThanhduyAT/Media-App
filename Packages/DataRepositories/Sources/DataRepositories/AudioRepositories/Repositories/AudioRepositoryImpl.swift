//
//  File.swift
//  DataRepositories
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import AudioDomain

public final class AudioRepositoryImpl {
    // Todo
    private var isLostRemoteConnection: Bool = true
    private let localStorage: AudioStorageInterface
    
    init(localStorage: AudioStorageInterface) {
        self.localStorage = localStorage
    }
}

extension AudioRepositoryImpl: AudioRepository {
    public func fetchAudioList() async throws -> [Audio] {
        do {
            guard !isLostRemoteConnection else {
                throw NSError(domain: "TestError", code: 1, userInfo: nil)
            }
            return []
        } catch {
            let audioStorage = localStorage.fetchAll()
            let audioList: [Audio] = audioStorage.compactMap({ audio in
//                audio.audio
                Audio(id: audio.id, duration: audio.duration, url: audio.url, title: audio.title, artist: audio.artist)
            })
            return audioList
        }
    }
    
    public func getAudioDetails(id: String) async throws -> Audio? {
        return nil
    }
}
