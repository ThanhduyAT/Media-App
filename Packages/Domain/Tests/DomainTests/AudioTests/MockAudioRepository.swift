//
//  MockAudioRepository.swift
//  Domain
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import AudioDomain

class MockAudioRepository: AudioRepository {
    var mockAudioList: [Audio] = []
    var shouldThrowError = false
    
    func fetchAudioList() async throws -> [Audio] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        return mockAudioList
    }
    
    func getAudioDetails(id: String) async throws -> Audio? {
        return nil
    }
}
