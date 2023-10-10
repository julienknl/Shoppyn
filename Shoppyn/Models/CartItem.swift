//
//  Item.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import Foundation

struct CartItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String = ""
    var quantity: Int = 0
    var amount: Double = 0.0
}
