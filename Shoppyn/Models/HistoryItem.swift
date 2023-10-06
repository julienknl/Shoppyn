//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 6/10/2023.
//

import SwiftUI

struct HistoryItem: Identifiable {
    var date: String?
    var overBudget: Bool = false
    var afterBudget: Double? = 0.0
    var initialBudget: Double? = 0.0
    var id: String = UUID().uuidString
}
