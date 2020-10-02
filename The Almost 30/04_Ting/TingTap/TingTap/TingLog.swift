//
//  TingLog.swift
//  TingTap
//
//  Created by Labtanza on 9/3/20.
//  Copyright © 2020 carlynorama. All rights reserved.
//

import Foundation

//let tingData:Array<Ting> = (TingLog().loadTings()) ??  ([
//    Ting(date: Date()),
//    Ting(date: Date(timeIntervalSinceNow: -3600)),
//    Ting(date: Date(timeIntervalSinceNow: -7200))
//])

struct TingLog {
    
    let tingLogURL = URL(fileURLWithPath: "done",
                         relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("txt")
    
    let dateFormatter = DateFormatter()//ISO8601DateFormatter()
    
    let logFormatString = "yyyy-MM-dd HH:mm:ss Z"
//    let displayFormatString = "MMM d, yyyy h:mm a"
    
    
    func tingLogString(_ ting:Ting) -> String {
        dateFormatter.dateFormat = logFormatString
        return String("\n\(dateFormatter.string(from: ting.date))")
    }
    
//    func tingDescription(_ ting:Ting) -> String {
//        dateFormatter.dateFormat = displayFormatString
//        return String("\(dateFormatter.string(from: ting.date))")
//    }
    
    
    private func loadData() -> String {
        let data:String = (try? String(contentsOf: tingLogURL)) ?? ""
        //print("existing data: \(data)")
        return data
    }
    
    func loadTings() -> Array<Ting>?{
        var tingArray:Array<Ting> = []
        let fileData = loadData()
        let lineStrings = fileData.components(separatedBy: .newlines)
        
//        let lineStrings = [
//            "2020-08-03 10:01:44 -0700",
//            "2020-08-04 10:01:59 -0700",
//            "2020-09-02 10:36:00 -0700"
//        ]
        
        for line in lineStrings {
            if let foundTing = Ting(from: line, withFormat: logFormatString) {
                tingArray.append(foundTing)
                print("Thing found: \(foundTing)")
            } else {
                print("Nothing in that line: \(line)")
            }
        }
        print(tingArray)
        
//        tingArray = [
//            Ting(date: Date(timeIntervalSinceNow: -13600)),
//            Ting(date: Date(timeIntervalSinceNow: -14000)),
//            Ting(date: Date(timeIntervalSinceNow: -17200)),
//            Ting(date: Date(timeIntervalSinceNow: -24200))
//        ]
        
        if tingArray.count > 0 {
            return tingArray
        } else {
            return nil
        }
        
    }
    
    private func clearLog() {
        let fileData = ""
        do {
            try fileData.write(to: tingLogURL, atomically: true, encoding: String.Encoding.utf8)
            //self.recentThingDate = thing.dateDone
            print(tingLogURL)
        } catch let error {
            print(error)
        }
    }
    
    func logTing(_ ting:Ting) {
        var fileData = loadData()
        fileData.append(contentsOf: tingLogString(ting))
        do {
            try fileData.write(to: tingLogURL, atomically: true, encoding: String.Encoding.utf8)
            print(tingLogURL)
        } catch let error {
            print(error)
        }
        
    }
}
