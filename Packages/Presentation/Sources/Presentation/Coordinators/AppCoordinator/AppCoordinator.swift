//
//  AppSheet.swift
//  Presentation
//
//  Created by Duy Thanh on 1/3/25.
//


import Foundation
import SwiftUI
import Common

public enum AppScreen: Identifiable, Hashable {
    case none
    public var id: Self { return self }
}

public enum AppSheet: Identifiable, Hashable {
    case none
    public var id: Self { return self }
}

public enum AppFullScreenCover: Identifiable, Hashable {
    case login
    case home
    public var id: Self { return self }
}

@Observable
public class AppCoordinator: BaseCoordinatorProtocol {
    public typealias ScreenType = AppScreen
    public typealias SheetType = AppSheet
    public typealias FullScreenType = AppFullScreenCover

    public var path: NavigationPath = NavigationPath()
    
    public var sheet: AppSheet?
    
    public var fullScreenCover: AppFullScreenCover?
    
    public init() {}
}

public extension AppCoordinator {
    func push(_ screen: ScreenType) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

public extension AppCoordinator {
    func presentSheet(_ sheet: SheetType) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}

public extension AppCoordinator {
    func presentFullScreenCover(_ fullScreenCover: FullScreenType) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}

// MARK: - Presentation Style Providers
@MainActor 
public extension AppCoordinator {
    @ViewBuilder
    func build(_ screen: ScreenType) -> some View {
        switch screen {
        case .none:
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
        case .login:
            EmptyView()
        case .home:
            TabbarCoordinatorView()
        }
    }
}
