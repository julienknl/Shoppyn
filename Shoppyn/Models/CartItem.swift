//
//  Item.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import Foundation
import SwiftData

@Model
class CartItem: Identifiable {
    var id: String?
    var name: String
    var quantity: Int
    var amount: Double
    var isCheckOn: Bool
    
    @Relationship(inverse: \HistoryItem.cartItems)
    var history: HistoryItem? = nil
    
    init(name: String = "", quantity: Int = 0, amount: Double = 0, isCheckOn: Bool = false) {
        self.id = UUID().uuidString
        self.name = name
        self.quantity = quantity
        self.amount = amount
        self.isCheckOn = isCheckOn
    }
}
