//
//  MediaApp_Clean_ArchitectureApp.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 14/2/25.
//

import SwiftUI
import SwiftData
import Presentation

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

@main
struct MediaApp_Clean_ArchitectureApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
        .modelContainer(sharedModelContainer)
    }
}
