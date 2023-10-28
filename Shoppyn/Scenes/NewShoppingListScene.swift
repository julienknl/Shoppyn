//
//  NewShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct NewShoppingListScene: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    private let repository: CartItemRepository
    @State private var item: CartItem = CartItem()
    private var isNew: Bool = false
    @State private var tmpCartItems: [CartItem] = []
    @State private var historyItem: HistoryItem = HistoryItem()
    
    init(isNew: Bool, historyItem: HistoryItem = HistoryItem()) {
        repository = CartItemRepository(context: _context)
        self.isNew = isNew
        self._historyItem = State(initialValue: historyItem)
    }
    
    var body: some View {
        
        VStack {
            
            UnderlineTextField(budget: Binding(get: {historyItem.initialBudget ?? 0 > 0 ? String(historyItem.initialBudget ?? 0) : "" },
                                               set: { if let newBudget = Double($0) { historyItem.initialBudget = newBudget } }), keyboardType: .decimalPad)
            
            HStack {
                OutlineTextField(item: $item.name,
                                 placeholder: "Item name",
                                 size: CGSize(width: 0, height: 43))
                
                OutlineTextField(item: Binding(get: { item.quantity > 0 ? String(item.quantity) : "" },
                                               set: { if let quantity = Int($0) { item.quantity = quantity } }),
                                 placeholder: "Qty",
                                 size: CGSize(width: 60, height: 43),
                                 keyboardType: .decimalPad)
                
                Button(action: {
                    addItemByItem(CartItem(name: item.name,
                                           quantity: item.quantity,
                                           amount: 0.0))
                    
                    item = CartItem()
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(uiImage: UIImage(named: "addicon") ?? UIImage())
                }
                .opacity(item.name != "" && item.quantity != 0 ? 1.0 : 0.2)
                .disabled(!(item.name != "" && item.quantity != 0))
            }
            .padding([.top, .leading, .trailing], 16)
            
            List {
                ForEach(!isNew ? $historyItem.cartItems : $tmpCartItems) { item in
                    SimpleItem(item: item)
                }
                .onDelete(perform: { indexes in
                    for index in indexes {
                        deleteItem(historyItem.cartItems[index])
                    }
                })
            }
            .ignoresSafeArea()
            .listStyle(PlainListStyle())
            .padding([.top], 8)
            
            Spacer()
        }
        .toolbar {

            if isNew {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addItems()
                    }, label: {
                        Text("Done")
                    })
                    .opacity(historyItem.initialBudget ?? 0 > 0 && tmpCartItems.count > 0 ? 1.0 : 0.5)
                    .disabled(!(historyItem.initialBudget ?? 0 > 0 && tmpCartItems.count > 0))
                }
            }
        }
        .onDisappear(perform: {
            if !isNew {
                updateItem()
            }
        })
    }
    
    private func addItemByItem(_ item: CartItem) {
        
        if isNew {
            tmpCartItems.insert(item, at: 0)
        }
        else {
            item.history = historyItem
            repository.insert(item)
        }
    }
    
    private func addItems() {
        let repository = HistoryRepository(context: _context)
        repository.insert(items: tmpCartItems, budget: historyItem.initialBudget ?? 0)
        coordinator.popToRoot()
    }
    
    private func deleteItem(_ item: CartItem) {
        if isNew {
            tmpCartItems.removeAll(where: { $0.id == item.id })
        }
        else {
            repository.delete(item)
        }
    }
    
    private func updateItem() {
        let repository = HistoryRepository(context: _context)
        repository.update(historyItem, newBudget: historyItem.initialBudget ?? 0)
    }
}

#Preview {
    NewShoppingListScene(isNew: true)
}
