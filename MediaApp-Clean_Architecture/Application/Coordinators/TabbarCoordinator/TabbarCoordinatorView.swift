//
//  TabbarCoordinatorView.swift
//  MediaApp-Clean_Architecture
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI

struct TabbarCoordinatorView: View {
    @State private var audioCoordinator = AudioCoordinator()
    @Environment(AppCoordinator.self) private var appCoordinator
    
    var body: some View {
        TabView {
            // First Tab
            
            NavigationStack(path: $audioCoordinator.path) {
                audioCoordinator.build(.audioDetail)
                    .navigationDestination(for: AudioScreen.self) { route in
                        audioCoordinator.build(route)
                    }
            }
            .tabItem {
                Image(systemName: "music.note.list")
                Text("Home")
            }
//            .environmentObject(musicCoordinator)


            // Second Tab
//            MusicView(vm)
//                .tabItem {
//                    Image(systemName: "gearshape")
//                    Text("Settings")
//                }

            // Third Tab
            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
