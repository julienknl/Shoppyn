//
//  HistoryRepository.swift
//  Shoppyn
//
//  Created by Julien on 15/10/2023.
//

import SwiftUI
import SwiftData

class HistoryRepository {
    private let context: Environment<ModelContext>
    
    init(context: Environment<ModelContext>) {
        self.context = context
    }
    
    func insert(items: [CartItem], budget: Double) {
        let tmpHistory = HistoryItem(id: UUID().uuidString,
                                     date: Date(),
                                     afterBudget: budget, 
                                     initialBudget: budget)
        tmpHistory.cartItems = items
        tmpHistory.progress = budget/1
        
        //Then create a history
        context.wrappedValue.insert(tmpHistory)
    }
    
    func update(_ item: HistoryItem, newBudget: Double) {
        item.initialBudget = newBudget
        
        do {
            try context.wrappedValue.save()
        }
        catch {
            print("Error: Failed to update history item with error \(error)")
        }
    }
    
    func update(_ item: HistoryItem, afterBudget: Double, completed: Bool = false) {
        item.afterBudget = afterBudget
        item.completed = completed
        
        do {
            try context.wrappedValue.save()
        }
        catch {
            print("Error: Failed to update history item with error \(error)")
        }
    }
    
    func delete(_ item: HistoryItem) {
        context.wrappedValue.delete(item)
        
        do {
            try context.wrappedValue.save()
        }
        catch {
            print("Error: Failed to delete history item with error \(error)")
        }
    }
}
