//
//  Untitled.swift
//  DIContainer
//
//  Created by Duy Thanh on 1/3/25.
//

import Factory
import Foundation
import AudioDomain
import DataRepositories
import SwiftData

public protocol AudioDetailViewModelFactory {
    func makeAudioUseCase() -> AudioUseCase
}

public extension Container {
    var modelContainer: Factory<ModelContainer> {
        self {
            let schema = Schema([AudioPersistent.self])
            let configuration = ModelConfiguration(isStoredInMemoryOnly: false)
            guard let container = try? ModelContainer(for: schema, configurations: configuration) else {
                fatalError("❌ Failed to initialize ModelContainer")
            }
            return container
        }
    }
    
    var modelContext: Factory<ModelContext> {
        self {
            ModelContext(self.modelContainer())
        }
    }
    
    var audioStorage: Factory<AudioStorage> {
        self {
            AudioStorageImpl(context: self.modelContext())
        }
    }
    
    var audioRepository: Factory<AudioRepository> {
        self {
            AudioRepositoryImpl(localStorage: self.audioStorage())
        }
    }
    
    var audioUseCase: Factory<AudioUseCase> {
        self {
            AudioUseCaseImpl(repository: self.audioRepository())
        }
    }
}

extension Container: AudioDetailViewModelFactory {
    public func makeAudioUseCase() -> AudioUseCase {
        return audioUseCase.shared()
    }
}




