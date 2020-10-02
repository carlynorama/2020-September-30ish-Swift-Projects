//
//  WorkDetailView.swift
//  CarmenH
//
//  Created by Carlyn Maw on 9/15/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import SwiftUI
import Foundation

struct WorkDetailView: View {
    //@Environment(\.openURL) var openURL
    
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
//                if verifyUrl(urlString: work.referenceURL){
//                    Button("more") {
//                        openURL(URL(string: work.referenceURL!)!)
//                    }
//                // or
//                Link("Learn SwiftUI", destination: URL(string: "https://www.hackingwithswift.com/quick-start/swiftui")!)
//                }
            }
        }.padding()
    }
}


 func verifyUrl (urlString: String?) -> Bool {
    if let urlString = urlString {
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
    }
    return false
}


struct WorkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetailView(work: worksArray[0])
    }
}
