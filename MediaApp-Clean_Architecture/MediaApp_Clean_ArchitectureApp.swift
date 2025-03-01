//
//  MediaApp_Clean_ArchitectureApp.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 14/2/25.
//

import SwiftUI
import SwiftData

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
