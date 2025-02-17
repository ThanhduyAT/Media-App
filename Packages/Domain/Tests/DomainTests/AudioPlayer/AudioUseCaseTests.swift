import Testing
@testable import AudioPlayer

struct AudioUseCaseTests {
    var useCase: AudioUseCase!
    var mockRepository: MockAudioRepository!
    
    init() {
        mockRepository = MockAudioRepository()
        useCase = AudioUseCase(repository: mockRepository)
    }

    @Test
    func testGetCurrentAudio_Success() async throws {
        // Arrange
        let expectedAudio = Audio(
            id: "1",
            duration: 3.0,
            url: "url",
            title: "Song",
            artist: "Thanh Duy"
        )
        mockRepository.mockAudioList = [expectedAudio]

        // Act
        let result = try await useCase.getCurrentAudio(index: 0)

        // Assert
        #expect(result?.id == expectedAudio.id)
        #expect(result?.title == expectedAudio.title)
    }
    
    @Test
    func testGetCurrentAudio_IndexOutOfBounds_ReturnsNil() async throws {
        // Arrange
        mockRepository.mockAudioList = [
            Audio(
                id: "1",
                duration: 3.0,
                url: "url",
                title: "Song",
                artist: "Thanh Duy"
            ),
            Audio(
                id: "2",
                duration: 3.0,
                url: "url",
                title: "Song",
                artist: "Duy123"
            ),
        ]

        // Act
        let result = try await useCase.getCurrentAudio(index: 5)

        // Assert
        #expect(result == nil)
    }
    
    @Test
    func testGetCurrentAudio_RepositoryThrowsError_ThrowsError() async throws {
        // Arrange
        mockRepository.shouldThrowError = true
        
        // Act & Assert
        await #expect(throws: Error.self) {
            try await useCase.getCurrentAudio(index: 0)
        }
    }
}
