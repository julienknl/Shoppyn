//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 6/10/2023.
//

import Foundation
import SwiftData

@Model
class HistoryItem: Identifiable {
    @Attribute(.unique) var id: String?
    var date: Date?
    var overBudget: Bool
    var afterBudget: Double?
    var initialBudget: Double?
    var completed: Bool
    var cartItems: [CartItem] = []
    
    init(id: String? = nil, date: Date? = nil, overBudget: Bool = false, afterBudget: Double? = 0.0, initialBudget: Double? = 0.0, completed: Bool = false) {
        self.id = id
        self.date = date
        self.overBudget = overBudget
        self.afterBudget = afterBudget
        self.initialBudget = initialBudget
        self.completed = completed
    }
}
