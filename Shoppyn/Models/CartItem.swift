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
    var referenceId: String?
    var name: String
    var quantity: Int
    var amount: Double
    var isCheckOn: Bool
    
    init(referenceId: String? = nil, name: String = "", quantity: Int = 0, amount: Double = 0, isCheckOn: Bool = false) {
        self.id = UUID().uuidString
        self.referenceId = referenceId
        self.name = name
        self.quantity = quantity
        self.amount = amount
        self.isCheckOn = isCheckOn
    }
}
