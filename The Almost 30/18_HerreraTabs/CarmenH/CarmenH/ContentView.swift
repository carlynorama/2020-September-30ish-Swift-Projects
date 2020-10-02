//
//  ContentView.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/14/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI


func loadTabData() -> Array<TabItem> {
    var tabItemArray:[TabItem] = []
    let sortedWorks = worksArray.sorted {
        ($0.year ?? "3000") < ($1.year ?? "3000")
    }
    
    //            ForEach(0..<myArray.count) { index in
    //                Text(String(describing: myArray[index])).tag(index)
    //            }
    
    for (index, element) in sortedWorks.enumerated() {
      let newItem = TabItem(work: element, image: Image(systemName: "circle.fill"), tag: index)
        tabItemArray.append(newItem)
    }
    
    return tabItemArray
}

struct ContentView: View {
    let tabData = loadTabData()
    
    @State private var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {

            ForEach(tabData) { tabItem in
                WorkDetailView(work: tabItem.work)
                    .tabItem {
                        Text("\(tabItem.work.year ?? "--")" )
                        tabItem.image
                }.tag(tabItem.tag)
            }
        }

    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var work: Work
    var image: Image
    //var color:Color
    var tag: Int
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
