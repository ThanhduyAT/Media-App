//
//  File.swift
//  Domain
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation

public protocol AudioUseCaseInterface {
    func getCurrentAudio(index: Int) async throws -> Audio?
}

public struct AudioUseCase: AudioUseCaseInterface {
    private let repository: AudioRepository
    
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
