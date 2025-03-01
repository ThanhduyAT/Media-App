//
//  BaseCoordinatorProtocol.swift
//  Common
//
//  Created by Duy Thanh on 1/3/25.
//


import SwiftUI

public protocol BaseCoordinatorProtocol: ObservableObject {
    associatedtype SheetType: Identifiable & Hashable
    associatedtype FullScreenType: Identifiable & Hashable
    associatedtype ScreenType: Identifiable & Hashable
    
    var path: NavigationPath { get set }
    var sheet: SheetType? { get set }
    var fullScreenCover: FullScreenType? { get set }
    
    func push(_ screen:  ScreenType)
    func presentSheet(_ sheet: SheetType)
    func presentFullScreenCover(_ fullScreenCover: FullScreenType)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

public extension BaseCoordinatorProtocol where ScreenType: Hashable {
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

public extension BaseCoordinatorProtocol where SheetType: Hashable {
    func presentSheet(_ sheet: SheetType) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}

public extension BaseCoordinatorProtocol where FullScreenType: Hashable {
    func presentFullScreenCover(_ fullScreenCover: FullScreenType) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}



