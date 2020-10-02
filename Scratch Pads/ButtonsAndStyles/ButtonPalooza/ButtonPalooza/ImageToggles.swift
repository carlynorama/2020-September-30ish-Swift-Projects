//
//  ImageToggles.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SystemImageToggles: View {
    @State var toggleState:Bool = false
    
    var body: some View {
        VStack {
            Toggle("I am a toogle", isOn: $toggleState)
            Toggle(isOn: $toggleState) {
                Text("toggle")
            }.labelsHidden()
            
            Toggle(isOn: $toggleState) {
                Text("toggle")
            }.toggleStyle(CheckboxToggleStyle())
            
            Toggle(isOn: $toggleState) {
                Text("toggle me")
            }.toggleStyle(AudioToggleStyle())
            
            Toggle("I am a toogle", isOn: $toggleState).toggleStyle(RadioButtonStyle())
            
        }.padding()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square" )
            .resizable()
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

struct AudioToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            //Spacer()
            Image(systemName: configuration.isOn ? "speaker.2.fill" : "speaker.slash.fill" )
            //.resizable()
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

struct RadioButtonStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            //Spacer()
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle" )
            //.resizable()
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

struct ImageToggles_Previews: PreviewProvider {
    static var previews: some View {
        SystemImageToggles()
    }
}
