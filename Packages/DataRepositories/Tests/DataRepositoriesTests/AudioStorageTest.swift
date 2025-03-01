import Testing
import AudioDomain
import SwiftData
@testable import DataRepositories

class AudioStorageTest {
    var modelContainer: ModelContainer!
    var modelContext: ModelContext!
    
    init() {
        modelContainer = try! ModelContainer(for: AudioPersistent.self, configurations: .init(isStoredInMemoryOnly: true))
        modelContext = ModelContext(modelContainer)
    }
    
    @Test func testSaveAudio() async throws {
        let storage = AudioStorageImpl(context: modelContext)
        let audioPersistent = AudioPersistent(
            id: "1",
            duration: 3.0,
            url: "url",
            title: "Song",
            artist: "Thanh Duy"
        )
        
        storage.save(audioPersistent)

        let savedAudios = storage.fetchAll()
        
        #expect(savedAudios.count == 1)
    }
}


