//
//  File.swift
//  Domain
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation

public protocol AudioRepository {
    func fetchAudioList() async throws -> [Audio]
    func getAudioDetails(id: String) async throws -> Audio?
}
