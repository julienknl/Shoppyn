//
//  Item.swift
//  Shoppyn
//
//  Created by Julien on 3/10/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
