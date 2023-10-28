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
