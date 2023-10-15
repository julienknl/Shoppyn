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
    
    func update(_ item: HistoryItem, newBudget: Double) {
        item.initialBudget = newBudget
        
        do {
            try context.wrappedValue.save()
        }
        catch {
            print("Error: Failed to update history item with error \(error)")
        }
    }
}
