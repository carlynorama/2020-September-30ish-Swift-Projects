//
//  ItemsScroller1.swift
//  FancyScrolls
//
//  Created by Carlyn Maw on 9/18/20.
//

import SwiftUI

struct ItemsScroller1: View {

        let colors: [Color] = [.red, .green, .blue]

        var body: some View {
            ScrollView {
                ScrollViewReader { scrollProxy in
                    Button("Jump to #8") {
                        withAnimation() {
                            scrollProxy.scrollTo(8, anchor: .top)
                        }
                        
                    }

                    ForEach(0..<10) { i in
                        Text("Example \(i)")
                            .frame(width: 300, height: 300)
                            .background(colors[i % colors.count])
                            .id(i)
                    }
                }
            }
        }
    
}

struct ItemsScroller1_Previews: PreviewProvider {
    static var previews: some View {
        ItemsScroller1()
    }
}
