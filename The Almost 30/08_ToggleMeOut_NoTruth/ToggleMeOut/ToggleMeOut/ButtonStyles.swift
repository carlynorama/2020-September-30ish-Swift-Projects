//
//  ButtonStyles.swift
//  ToggleMeOut
//
//  Created by Labtanza on 9/7/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

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

struct ButtonStyles: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyles()
    }
}
