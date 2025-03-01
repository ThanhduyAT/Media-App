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
// MARK: - Presentation Style Providers
@MainActor 
public extension AppCoordinator {
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
