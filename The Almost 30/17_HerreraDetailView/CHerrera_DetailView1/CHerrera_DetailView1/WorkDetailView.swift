//
//  WorkDetailView.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI

struct WorkDetailView: View {
    // @Environment(\.horizontalSizeClass) var sizeClass
    @State var orientation = UIDevice.current.orientation
    
    let work:Work
    
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        VStack {
            Group {
                self.work.representation
                    .aspectRatio(self.work.size.ratio, contentMode: .fit)
                    .shadow(radius: 0)
                   
            } .shadow(radius: 15)
              .padding(.bottom, 20)
            VStack(alignment: .leading, spacing: 2) {
                Text("Inspired by")
                Text(self.work.artist).font(.title)
                Text("\(self.work.title), \(self.work.year ?? "")").font(.title)
                //Text(self.work.medium ?? "").font(.body)
            }
        }.padding()
    }
}

//struct workContent: View {
//    let work:Work
//
//    var body: some View {
//
//        GeometryReader { geometry in
//           Group {
//
//            }
//        }
//    }
//}


//struct artView: View {
//    let work:Work
//
//    var body: some View {
//        GeometryReader { geometry in
//            self.work.representation
//                .aspectRatio(self.work.size.ratio, contentMode: .fit)
//
//                //.clipped()
//                .border(Color.green, width: 5)
//        }
//    }
//
//}
//
//struct artMetaView:View {
//    let work:Work
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            Text("\(self.work.title), \(self.work.year ?? "")").font(.largeTitle)
//            Text(self.work.medium ?? "").font(.body)
//        }
//    }
//
//}

struct WorkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailView(work: worksArray[3])
    }
}


//Group {
//    GeometryReader { geometry in
//        if self.orientation.isLandscape {
//            HStack {
//                artView(work: self.work)
//                    .frame(width: geometry.size.width)
//                artMetaView(work: self.work)
//                //workContent(work: work)
//            }
//        } else {
//            VStack(alignment: .center) {
//                artView(work: self.work)
//                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.75,alignment: .center)
//                artMetaView(work: self.work)
//                //workContent(work: work)
//            }
//        }
//    }.onReceive(orientationChanged) { _ in
//        self.orientation = UIDevice.current.orientation
//
//    }.padding()
//}
