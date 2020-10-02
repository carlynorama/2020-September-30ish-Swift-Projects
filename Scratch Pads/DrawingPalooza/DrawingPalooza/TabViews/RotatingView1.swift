//
//  RotatingView1.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/using-groups-as-transparent-layout-containers

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct RotatingView1: View {
    //@State private var layoutVertically = false
    @Environment(\.horizontalSizeClass) var sizeClass
    //@Environment(\.)

    var body: some View {
        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
//        .onTapGesture {
//            self.layoutVertically.toggle()
//        }
    }
}

struct RotatingView1_Previews: PreviewProvider {
    static var previews: some View {
        RotatingView1()
    }
}
