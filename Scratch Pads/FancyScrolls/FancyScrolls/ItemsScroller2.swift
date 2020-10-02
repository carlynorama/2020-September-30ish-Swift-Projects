//
//  ItemsScroller2.swift
//  FancyScrolls
//
//  Created by Carlyn Maw on 9/18/20.
//

import SwiftUI

struct ScrollItem: Identifiable {
    var id = UUID()
    var image: Image
    var caption: Text
    var color:Color
    var tag: Int
}

let colorsArray:[Color] = [
    Color.blue, Color.red, Color.orange, Color.black, Color.green, Color.yellow
]

var complimentaryColors = [
    Color.red:Color.green,
    Color.orange:Color.blue,
    Color.yellow:Color.purple,
    Color.green:Color.red,
    Color.blue:Color.orange,
    Color.purple:Color.yellow,
    Color.black:Color.white
]

func incrementLoop(current:Int, max:Int, min:Int) -> Int {
    var newValue:Int
    if current >= max {
        newValue = 0
    } else {
        newValue = current + 1
    }
    return newValue
}

struct ItemsScroller2: View {
    let scrollData = loadTabData(colorArray: colorsArray)
    
    static func loadTabData(colorArray:[Color]) -> Array<ScrollItem> {
        var scrollItemArray:[ScrollItem] = []
        //        let sortedWorks = worksArray.sorted {
        //            ($0.year ?? "3000") < ($1.year ?? "3000")
        //        }
        
        for (index, element) in colorsArray.enumerated() {
            let newItem = ScrollItem(image: Image(systemName: "circle.fill"), caption: Text("My Caption \(index)"), color: element, tag: index)
            scrollItemArray.append(newItem)
        }
        
        return scrollItemArray
    }
    
    
    @State private var scrollPosition: Int = 0
    
    var body: some View {
        VStack {
            Button("Move") {
                self.scrollPosition = incrementLoop(current: self.scrollPosition, max: scrollData.count-1, min: 0)
            }
            ScrollView(.horizontal) {
                ScrollViewReader { scrollProxy in
                    HStack {
                        ForEach(scrollData) { scrollItem in
                            Rectangle()
                                .foregroundColor(scrollItem.color)
                                .overlay(
                                    scrollItem.image
                                        .resizable()
                                        .foregroundColor(complimentaryColors[scrollItem.color])
                                )
                                .frame(width: 200, height: 300, alignment: .center)
                                .background(colorsArray[scrollItem.tag % colorsArray.count])
                                .id(scrollItem.tag)
                                .onChange(of: scrollPosition, perform: { value in
                                    withAnimation() {
                                        scrollProxy.scrollTo(value, anchor: .center)
                                    }
                                })
                        }
                    }
                }
            }
            scrollData[self.scrollPosition].caption
        }
    }
}
struct ItemsScroller2_Previews: PreviewProvider {
    static var previews: some View {
        ItemsScroller2()
    }
}
