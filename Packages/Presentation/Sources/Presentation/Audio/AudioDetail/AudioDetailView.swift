//
//  File.swift
//  Presentation
//
//  Created by Duy Thanh on 16/2/25.
//

import Foundation
import SwiftUI

public struct AudioDetailView: View {
    public var body: some View {
        VStack {
            HStack {
                Button("Audio List") {}
                Spacer()
                
                Button("Add File") {}
            }
            .padding()
            
            Spacer()
            
//            Text(vm.audioPlayer?.url?.lastPathComponent ?? "")
//                .font(.largeTitle)
            
            Spacer()
            
//            ProgressView(value: vm.currentTime, total: vm.duration)
//                .padding(.horizontal)
        }
        .navigationTitle("Music")
    }
    
    public init() {}
}
