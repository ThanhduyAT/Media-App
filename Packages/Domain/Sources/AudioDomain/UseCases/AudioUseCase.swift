//
//  File.swift
//  Domain
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import AVFoundation

public protocol PlayAudioUseCase {
    func loadPlaylist(list: [Audio]) async throws
    func play()
    func pause()
    func playNext()
    func playPrevious()
}

public protocol AudioUseCase: PlayAudioUseCase {
    func getCurrentAudio(index: Int) async throws -> Audio?
}

public class AudioUseCaseImpl: AudioUseCase {
    private let repository: AudioRepository
    private var player: AVQueuePlayer?
    private var playerItems: [AVPlayerItem] = []
    
    public init(repository: AudioRepository) {
        self.repository = repository
    }
    
    public func getCurrentAudio(index: Int) async throws -> Audio? {
        let audioList = try await repository.fetchAudioList()
        
        guard index >= 0, index < audioList.count else {
            return nil
        }
        return audioList[index]
    }
}

extension AudioUseCaseImpl {
    public func loadPlaylist(list: [Audio] = []) async throws {
        if !list.isEmpty {
            let urls = list.compactMap({ item in
                URL(string: item.url)
            })
            playerItems = urls.map { AVPlayerItem(url: $0) }
            player = AVQueuePlayer(items: playerItems)
            return
        }
        let audioList = try? await repository.fetchAudioList()
        if let urls = audioList?.compactMap({item in URL(string: item.url)}) {
            playerItems = urls.map { AVPlayerItem(url: $0) }
            player = AVQueuePlayer(items: playerItems)
        }
    }
    
    public func play() {
        player?.play()
    }
    
    public func pause() {
        player?.pause()
    }
    
    public func playNext() {
        player?.advanceToNextItem()
    }
    
    public func playPrevious() {
    }
}
