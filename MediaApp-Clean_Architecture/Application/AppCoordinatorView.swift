//
//  RootCoordinatorView.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI

struct AppCoordinatorView: View {
    @State private var appCoordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.home)
                .navigationDestination(for: AppScreen.self) { screen in
                    appCoordinator.build(screen)
                }
                .sheet(item: $appCoordinator.sheet) { sheet in
                    appCoordinator.build(sheet)
                }
                .fullScreenCover(item: $appCoordinator.fullScreenCover) { fullScreenCover in
                    appCoordinator.build(fullScreenCover)
                }
        }
        .environment(appCoordinator)
    }
}
