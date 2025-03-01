//
//  BaseCoordinatorProtocol.swift
//  Common
//
//  Created by Duy Thanh on 1/3/25.
//


import SwiftUI
import Foundation

public protocol BaseCoordinatorProtocol: AnyObject {
    associatedtype ScreenType: Identifiable & Hashable
    associatedtype SheetType: Identifiable & Hashable
    associatedtype FullScreenType: Identifiable & Hashable
    
    var path: NavigationPath { get set }
    func push(_ screen:  ScreenType)
    func pop()
    func popToRoot()
    
    var sheet: SheetType? { get set }
    func presentSheet(_ sheet: SheetType)
    func dismissSheet()
    
    var fullScreenCover: FullScreenType? { get set }
    func presentFullScreenCover(_ fullScreenCover: FullScreenType)
    func dismissFullScreenCover()
}



