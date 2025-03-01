//
//  File.swift
//  Presentation
//
//  Created by Duy Thanh on 18/2/25.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers
import AudioDomain
import AVFoundation

struct AudioPickerView: UIViewControllerRepresentable {
    var didPickDocuments: ([AudioModel]) -> Void
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        // Initialize UIDocumentPickerViewController for audio types
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.audio])
        documentPicker.delegate = context.coordinator
        documentPicker.allowsMultipleSelection = true
        return documentPicker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        // We don't need to update the view controller in this case
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(didPickDocuments: didPickDocuments)
    }
    
    // Coordinator to handle delegate methods
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var didPickDocuments: ([AudioModel]) -> Void
        
        init(didPickDocuments: @escaping ([AudioModel]) -> Void) {
            self.didPickDocuments = didPickDocuments
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            Task {
                let audioList = await withTaskGroup(of: AudioModel?.self, returning: [AudioModel].self) { taskGroup in
                    for url in urls {
                        taskGroup.addTask { await self.extractAudioMetadata(from: url) }
                    }
                    var audioList: [AudioModel] = []
                    for await result in taskGroup {
                        if let result = result {
                            audioList.append(result)
                        }
                    }
                    return audioList
                }
                didPickDocuments(audioList)
            }
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle cancellation if necessary
            print("Document Picker was cancelled")
        }
        
        private func extractAudioMetadata(from url: URL) async -> AudioModel? {
            let asset = AVAsset(url: url)
            
            do {
                let title = try await asset.loadMetadataItem(for: .commonKeyTitle)
                let artist = try await asset.loadMetadataItem(for: .commonKeyArtist)
                let album = try await asset.loadMetadataItem(for: .commonKeyAlbumName)
                let duration = try await asset.load(.duration)
                
                return AudioModel(
                    id: UUID().uuidString,
                    duration: CMTimeGetSeconds(duration),
                    url: url.absoluteString,
                    title: title ?? url.lastPathComponent,
                    artist: artist ?? "Unknown Artist"
                )
            } catch {
                print("Failed to load metadata for \(url): \(error.localizedDescription)")
                return nil
            }
        }
    }
}

extension AVAsset {
    func loadMetadataItem(for key: AVMetadataKey) async throws -> String? {
        let items = try await load(.metadata)
        return try await items.first(where: { $0.commonKey == key })?.load(.stringValue)
    }
}
