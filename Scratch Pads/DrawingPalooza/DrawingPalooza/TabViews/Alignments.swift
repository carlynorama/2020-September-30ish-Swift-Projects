//
//  Alignments.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/layout-and-geometry-introduction

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct Alignments: View {
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.trailing] }
                Text("This is a longer line of text")
            }
            .background(Color.red)
            .frame(width: 400, height: 200)
            .background(Color.blue)
            
            HStack(alignment: .midAccountAndName) {
                VStack {
                    Text("@twostraws")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 64, height: 64)
                }

                VStack {
                    Text("Full name:")
                    Text("PAUL HUDSON")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                        .font(.largeTitle)
                }
            }
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                }
            }
            .background(Color.red)
            .frame(width: 400, height: 200)
            .background(Color.blue)
            

        }
        

    }
}

struct Alignments_Previews: PreviewProvider {
    static var previews: some View {
        Alignments()
    }
}
