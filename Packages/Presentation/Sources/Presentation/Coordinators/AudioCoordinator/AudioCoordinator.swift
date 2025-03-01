//
//  AudioCoordinator.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI
import Presentation
import Common

enum AudioSheet: Identifiable, Hashable {
    case none
    var id: Self { return self }
}

enum AudioFullScreenCover: Identifiable, Hashable {
    case none
    var id: Self { return self }
}

enum AudioScreen: Identifiable, Hashable {
    case audioList
    case audioDetail
    var id: Self { return self }
}

@Observable
class AudioCoordinator: BaseCoordinatorProtocol {
    typealias ScreenType = AudioScreen
    typealias SheetType = AudioSheet
    typealias FullScreenType = AudioFullScreenCover

    var path: NavigationPath = NavigationPath()
    
    var sheet: AudioSheet?
    
    var fullScreenCover: AudioFullScreenCover?
}

@MainActor
extension AudioCoordinator {
    @ViewBuilder
    func build(_ screen: ScreenType) -> some View {
        switch screen {
        case .audioDetail:
            AudioDetailView()
        case .audioList:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(_ sheet: SheetType) -> some View {
        switch sheet {
        case .none:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenType) -> some View {
        switch fullScreenCover {
        case .none:
            EmptyView()
        }
    }
}

