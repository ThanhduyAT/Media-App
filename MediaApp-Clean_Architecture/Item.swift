//
//  Item.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 14/2/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
