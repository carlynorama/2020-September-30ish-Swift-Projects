//
//  SystemImageToggles.swift
//  ButtonPalooza
//
//  Created by Carlyn Maw on 9/10/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct SystemImageToggles: View {
    @State var toggleState:Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                Toggle("I am a toogle", isOn: $toggleState)
                Toggle("I am a constructed toggle", isOn: $toggleState)
                    .toggleStyle(ColoredToggleStyle())
                
                Toggle(isOn: $toggleState) {
                    Text("My label is hidden")
                }
                .labelsHidden()
                //.toggleStyle(SwitchToggleStyle(tint: Color.red)) //SwiftUI 2.0
            }
            
            Divider()
            
            VStack {
                Toggle(isOn: $toggleState) {
                    Text("Check Toggle")
                }.toggleStyle(CheckboxToggleStyle())
                    .frame(height:50)
                Toggle(isOn: $toggleState) {
                    Text("Multi Color Check")
                }
                .toggleStyle(CheckboxToggleStyle2())
                .frame(height:30)
                
                Toggle("Text can be active too", isOn: $toggleState)
                    .toggleStyle(RadioButtonStyle())
                    .frame(height:30) //NO EFFECT!!
            }
            
            
            Divider()
            
            HStack {
                Toggle(isOn: $toggleState) {
                    Text("toggle has jitter")
                }.toggleStyle(AudioToggleStyle())
                Spacer()
                Toggle(isOn: $toggleState) {
                    Text("jitter free toggle")
                }.toggleStyle(AudioToggleStyle2())
            }
            
            Divider()
            
            VStack {
                Text("The frame is in different places")
                HStack {
                    Toggle("Person Info", isOn: $toggleState)
                        .toggleStyle(PersonCropCircle())
                        .frame(width:50, height: 50)
            
                    Toggle("Person Info", isOn: $toggleState)
                        .toggleStyle(PersonCropCircle2())
                }
            }
            
            
            
        }.padding()
    }
}

struct ColoredToggleStyle: ToggleStyle {
    //https://stackoverflow.com/a/57931945 depricated SwiftUI 2.0
    var onColor = Color(UIColor.systemGreen)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square" )
                .resizable()
                .foregroundColor(configuration.isOn ? Color.green : Color.primary)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

struct CheckboxToggleStyle2: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square" )
                .resizable()
                .foregroundColor(configuration.isOn ? Color.green : Color.primary)
                .overlay(Image(systemName: "square")
                    .resizable()
                    .foregroundColor(.primary))
                .aspectRatio(contentMode: .fit)
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
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle" ).foregroundColor(configuration.isOn ? Color.accentColor : Color.primary)
            //.resizable()
            
        }.onTapGesture {
            configuration.isOn.toggle()
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

struct AudioToggleStyle2: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            //Spacer()
            
            ZStack(alignment: .center) {
                Image(systemName: "speaker.2.fill")
                    .opacity(configuration.isOn ? 1 : 0)
                Image(systemName: "speaker.slash.fill")
                    .opacity(configuration.isOn ? 0 : 1)
            }.onTapGesture {
                configuration.isOn.toggle()
            }
        }
    }
}


//TODO: How not to have hard coded numbers in these two
struct PersonCropCircle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: configuration.isOn ? "person.crop.circle.fill" : "person.crop.circle" )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    configuration.isOn.toggle()
            }
            configuration.label
        }
    }
}

struct PersonCropCircle2: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            ZStack(alignment: .center) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .opacity(configuration.isOn ? 1 : 0)
                    .foregroundColor(Color.green)
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .opacity(configuration.isOn ? 0 : 1)
            }
            .frame(width:50, height: 50)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            configuration.label
        }
    }
}

struct ImageToggles_Previews: PreviewProvider {
    static var previews: some View {
        SystemImageToggles()
    }
}
