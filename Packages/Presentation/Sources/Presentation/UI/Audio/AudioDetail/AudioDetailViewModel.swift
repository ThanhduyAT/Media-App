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
    var audioList: [Audio] = []
    var currentAudioIndex: Int = 0
    
    private let audioUseCase: AudioUseCase
    
    public init(factory: AudioDetailViewModelFactory) {
        self.audioUseCase = factory.makeAudioUseCase()
    }
}

extension AudioDetailViewModel {
    func loadAudioList(list: [Audio]) async throws {
        try await audioUseCase.loadPlaylist(list: list)
    }
}


