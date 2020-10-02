//
//  ContentView.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
import AVFoundation

let systemSoundID: SystemSoundID = 1057 //tink

struct HomeView: View {
    let thingLog = TingLog()
    
    @State private var tapCount:Int = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var noThing = false
    
    let refreshTime = DispatchTimeInterval.seconds(3)
    
    
    func refreshThing() {
        noThing = false
    }
    
    //let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: 24), repeats: true)
    
    func thingCompletion() {
        let thing = Ting(date: Date())
        self.thingLog.logTing(thing)
        
        self.tapCount += 1
        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        
        self.noThing = true
        
        
        print("Ting Done!")
        DispatchQueue.main.asyncAfter(deadline: .now() + refreshTime) {
            self.refreshThing()
        }
        
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.thingCompletion()
                AudioServicesPlaySystemSound (systemSoundID)
            }) {
                Text("Did thing.")
            }
            .buttonStyle(FilledButtonStyle())
            .disabled(noThing)
            Spacer()
            HStack {
                VStack {
                    Text("Tapped").opacity(noThing ? 1 : 0)
                    Text("Tap Tracker: \(tapCount) ")
                }
                Spacer()
                Button(action: {
                    print("tapped")
                }) {
                    Text("Tap History >")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
