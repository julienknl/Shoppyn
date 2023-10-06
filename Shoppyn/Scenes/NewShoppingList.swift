//
//  NewShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct NewShoppingList: View {
    
    @State private var budget: String = ""
    @State private var itemName: String = ""
    var isNew: Bool = false
    
    var body: some View {
        
        VStack {
            
            UnderlineTextField(budget: $budget)
            
            HStack {
                OutlineTextField(item: $itemName, 
                                 placeholder: "Item name",
                                 size: CGSize(width: 0, height: 43))
                
                OutlineTextField(item: $itemName, 
                                 placeholder: "Qty",
                                 size: CGSize(width: 60, height: 43),
                                 keyboardType: .decimalPad)
                
                Button(action: {

                }) {
                    Image(uiImage: UIImage(named: "addicon") ?? UIImage())
                }
            }
            .padding([.top, .leading, .trailing], 16)
            
            Spacer()
        }
        .toolbar {
            
            if !isNew {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Text("Edit")
                    })
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Text("Done")
                })
            }
        }
    }
}

#Preview {
    NewShoppingList()
}
