//
//  AppCoordinatorProtocol.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 16/2/25.
//
import SwiftUI

protocol BaseCoordinatorProtocol: ObservableObject {
    associatedtype SheetType = Identifiable & Hashable
    associatedtype FullScreenType = Identifiable & Hashable
    associatedtype ScreenType = Identifiable & Hashable
    
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
