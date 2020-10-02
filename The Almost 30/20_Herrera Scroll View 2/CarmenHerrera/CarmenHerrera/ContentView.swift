//
//  ContentView.swift
//  CarmenHerrera
//
//  Created by Carlyn Maw on 9/17/20.
//

import SwiftUI


func loadTabData() -> Array<ScrollItem> {
    var tabItemArray:[ScrollItem] = []
    let sortedWorks = worksArray.sorted {
        ($0.year ?? "3000") < ($1.year ?? "3000")
    }
    
    //            ForEach(0..<myArray.count) { index in
    //                Text(String(describing: myArray[index])).tag(index)
    //            }
    
    for (index, element) in sortedWorks.enumerated() {
      let newItem = ScrollItem(work: element, image: Image(systemName: "circle.fill"), tag: index)
        tabItemArray.append(newItem)
    }
    
    return tabItemArray
}


struct ContentView: View {
    let tabData = loadTabData()
    @State var scrollPosition: CGFloat = 0.0
    
    @State private var selectedTab = 0

    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                                ForEach(tabData) { tabItem in
                                    WorkDetailView(work: tabItem.work)
                                        .frame(width: 200, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }

}
}

struct ScrollItem: Identifiable {
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
