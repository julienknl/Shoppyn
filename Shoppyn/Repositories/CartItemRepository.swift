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
        let tmpHistory = HistoryItem(id: UUID().uuidString,
                                     date: Date(),
                                     initialBudget: budget)
        
        //Then create a history
        context.wrappedValue.insert(tmpHistory)
        
        // Add list of items first
        items.forEach { item in
            item.history = tmpHistory
            context.wrappedValue.insert(item)
        }
        
    }
    
    func insert(_ item: CartItem) {
        context.wrappedValue.insert(item)
    }
    
    func delete(_ item: CartItem) {
        context.wrappedValue.delete(item)
        
        do {
            try context.wrappedValue.save()
        }
        catch {
            print("Failed to delete cart item with error: \(error.localizedDescription)")
        }
    }
}
