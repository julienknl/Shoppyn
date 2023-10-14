//
//  SimpleItem.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import SwiftUI

struct SimpleItem: View {
    
    @Binding var item: CartItem
    var showCheckbox: Bool = false
    var isNew: Bool = true
    
    var body: some View {
        HStack {
            
            if showCheckbox {
                CheckBox(isOn: $item.isCheckOn)
                    .padding([.leading], 8)
            }
            
            Text("\(item.quantity) x \(item.name)")
                .lineLimit(1)
                .padding([.leading, .trailing], showCheckbox ? 2 : 8)
                .opacity(!showCheckbox && !isNew && item.amount <= 0 ? 0.5 : 1)
            
            Spacer()
            
            if item.isCheckOn && showCheckbox {
                HStack {
                    Text("$")
                    OutlineTextField(item: Binding(
                        get: {
                            item.amount > 0 ? (String(item.amount)) : ""
                        },
                        set: { newValue in
                            print(newValue.extractNumbers())
                            if let amount = Double(newValue) {
                                item.amount = amount
                            }
                        }
                    ),
                                     placeholder: "0.00",
                                     size: CGSize(width: 70, height: 43))
                }
                .padding([.leading, .trailing], 8)
            }

            
            if !showCheckbox && item.amount > 0 {
                Text("$\(item.amount.round(to: 2))")
                    .opacity(!showCheckbox && !isNew && item.amount <= 0 ? 0.5 : 1)
            }
            
        }.frame(height: 43)
    }
}

//#Preview {
//    SimpleItem(item: CartItem(name: "Item", quantity: 1), showCheckbox: false)
//}
