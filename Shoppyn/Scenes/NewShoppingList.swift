//
//  NewShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct NewShoppingList: View {
    
    @State private var budget: Double = 0.0
    @State private var item: CartItem = CartItem()
    var isNew: Bool = false
    @State var items: [CartItem] = []
    
    var body: some View {
        
        VStack {
            
            UnderlineTextField(budget: Binding(get: {budget > 0 ? String(budget) : "" },
                                               set: { if let newBudget = Double($0) { budget = newBudget } }), keyboardType: .decimalPad)
            
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
                    items.append(CartItem(name: item.name,
                                          quantity: item.quantity,
                                          amount: 0.0))
                    
                    item.name = ""
                    item.quantity = 0
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(uiImage: UIImage(named: "addicon") ?? UIImage())
                }
                .opacity(item.name != "" && item.quantity != 0 ? 1.0 : 0.2)
                .disabled(!(item.name != "" && item.quantity != 0))
            }
            .padding([.top, .leading, .trailing], 16)
            
            List {
                ForEach($items) { item in
                    SimpleItem(item: item)
                }
            }
            .ignoresSafeArea()
            .listStyle(PlainListStyle())
            .padding([.top], 8)
            
            Spacer()
        }
        .toolbar {
            
            if !isNew {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Edit")
                    })
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Text("Done")
                })
                .opacity(budget > 0 && items.count > 0 ? 1.0 : 0.5)
                .disabled(!(budget > 0 && items.count > 0))
            }
        }
    }
}

#Preview {
    NewShoppingList()
}
