//
//  File.swift
//  Presentation
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import AudioDomain
import AVFoundation
import MediaPlayer
import DIContainer

@Observable
public class AudioDetailViewModel {
    var audioList: [AudioModel] = []
    var currentAudioIndex: Int = 0
    
    private let audioUseCase: AudioUseCase
    
    public init(factory: AudioDetailViewModelFactory) {
        self.audioUseCase = factory.makeAudioUseCase()
    }
    
    @MainActor
    func taskLoadAudioList(list: [AudioModel]) {
        Task {
            do {
                try await loadAudioList(list: list)
            } catch {
                
            }
        }
    }
}

extension AudioDetailViewModel {
    func loadAudioList(list: [AudioModel]) async throws {
        let audioList = list.compactMap { audio in
            Audio(id: audio.id, duration: audio.duration, url: audio.url, title: audio.title, artist: audio.artist)
        }
        try await audioUseCase.loadPlaylist(list: audioList)
    }
    
    func play() {
        audioUseCase.play()
    }
}


