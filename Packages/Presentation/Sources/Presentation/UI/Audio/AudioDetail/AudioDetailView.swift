//
//  File.swift
//  Presentation
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI

struct AudioDetailView: View {
    @Environment(AudioCoordinator.self) private var audioCoordinator
    @State private var vm: AudioDetailViewModel
    @State private var addAudioList: Bool = false
    
    init(vm: AudioDetailViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            HStack {
                Button("Audio List") {}
                Spacer()
                
                Button("Add File") {
                    audioCoordinator.presentFullScreenCover(.audioPicker)
                }
            }
            .padding()
            
            Spacer()
            
            playContainerView
            
            Spacer()
        }
        .navigationTitle("Music")
        .onAppear() {
            
        }
        .onChange(of: audioCoordinator.audioList, { oldValue, newValue in
            vm.taskLoadAudioList(list: newValue)
        })
    }
    
    var playContainerView: some View {
        HStack {
            Button(action: {
                vm.play()
            }) {
                Image(systemName: "play.circle")
                    .scaleEffect(1.1)  // Apply scale effect based on isPlaying
                    .transition(.scale)  // Add scale transition
            }
            .font(.system(size: 40))
        }
    }
}
