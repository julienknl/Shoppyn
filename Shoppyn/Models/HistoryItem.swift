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
    var calculatedBudget: Double = 0.0
    var progress: Double = 1.0
    var completed: Bool
    var cartItems: [CartItem] = []
    
    init(id: String? = nil, date: Date? = nil, progress: Double = 1.0, afterBudget: Double? = 0.0, initialBudget: Double? = 0.0, completed: Bool = false) {
        var tmpCalculatedBudget = (initialBudget ?? 0.0) - (afterBudget ?? 0.0)
        self.afterBudget = afterBudget
        self.initialBudget = initialBudget
        self.calculatedBudget = tmpCalculatedBudget
        self.id = id
        self.date = date
        self.progress = progress
        self.overBudget = tmpCalculatedBudget.isNegative
        self.completed = completed
    }
}
