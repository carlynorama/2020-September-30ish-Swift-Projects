//
//  ContentView.swift
//  Suspense
//
//  Created by Labtanza on 9/5/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var soundPlaying = false
    
    func playSystemSound(soundID: UInt32, todoAfter: @escaping (UInt32) -> Void) {
        self.soundPlaying = true
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(soundID)) {
            todoAfter(soundID)
        }
    }
    
    func onSoundCompletion(soundID:UInt32) {
        self.soundPlaying = false
        print("finished sound")
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.playSystemSound(soundID: 1332, todoAfter: self.onSoundCompletion)
            }) {
                Text("play")
            }
            .disabled(self.soundPlaying)
            .buttonStyle(FilledButtonStyle())
            Spacer()
        }
        
    }
}

// MARK: Styles
struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .secondary : .white)
            .padding()
            .background(Color.accentColor)
            .font(Font.custom("Avenir", size: 18))
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
