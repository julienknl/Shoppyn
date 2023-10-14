//
//  DateExtension.swift
//  Shoppyn
//
//  Created by Julien on 14/10/2023.
//

import Foundation

extension Date {
    
    ///Convert to readable date e.g 07 Apr 07
    func toReadableDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yy"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        let formattedDate = dateFormatter.string(from: self)
        let formattedTime = timeFormatter.string(from: self)
        return "\(formattedDate) at \(formattedTime)"
    }
}
