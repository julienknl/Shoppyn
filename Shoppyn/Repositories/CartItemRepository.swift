//
//  File.swift
//  Shoppyn
//
//  Created by Julien on 14/10/2023.
//

import SwiftUI
import SwiftData

class CartItemRepository {
    private let context: Environment<ModelContext>
    
    init(context: Environment<ModelContext>) {
        self.context = context
    }
    
    func insert(items: [CartItem], budget: Double) {
        let uid = UUID().uuidString
        
        // Add list of items first
        items.forEach { item in
            item.referenceId = uid
            context.wrappedValue.insert(item)
        }
        
        //Then create a history
        context.wrappedValue.insert(HistoryItem(id: uid,
                                                date: Date(),
                                                initialBudget: budget))
    }
}
