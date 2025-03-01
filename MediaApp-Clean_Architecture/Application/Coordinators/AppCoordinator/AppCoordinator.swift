//
//  AppCoordinatorProtocol.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI
import Presentation
import Common

enum AppSheet: Identifiable, Hashable {
    case none
    var id: Self { return self }
}

enum AppFullScreenCover: Identifiable, Hashable {
    case login
    case home
    var id: Self { return self }
}

enum AppScreen: Identifiable, Hashable {
    case none
    var id: Self { return self }
}

@Observable
class AppCoordinator: BaseCoordinatorProtocol {
    var path: NavigationPath = NavigationPath()
    
    var sheet: AppSheet?
    
    var fullScreenCover: AppFullScreenCover?
    
    func push(_ screen: AppScreen) {
        
    }
    
    func presentSheet(_ sheet: AppSheet) {
        
    }
    
    func presentFullScreenCover(_ fullScreenCover: AppFullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        
    }
    
    func popToRoot() {
        
    }
    
    func dismissSheet() {
        
    }
    
    func dismissFullScreenOver() {
        
    }
}
// MARK: - Presentation Style Providers
extension AppCoordinator {
    @ViewBuilder
    func build(_ screen: AppScreen) -> some View {
        switch screen {
        case .none:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(_ sheet: AppSheet) -> some View {
        switch sheet {
        case .none:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: AppFullScreenCover) -> some View {
        switch fullScreenCover {
        case .login:
            EmptyView()
        case .home:
            TabbarCoordinatorView()
        }
    }
}
