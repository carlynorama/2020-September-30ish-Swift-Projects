#!/usr/bin/env swift

import Foundation

var dayString:String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
    return (dateFormatter.string(from: Date()))
}


print(dayString)

#https://www.raywenderlich.com/5027-scripting-in-swift-writing-a-script
