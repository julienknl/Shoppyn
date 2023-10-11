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
    
    var body: some View {
        HStack {
            
            if showCheckbox {
                CheckBox(isOn: $item.isCheckOn)
                    .padding([.leading], 8)
            }
            
            Text("\(item.quantity) x \(item.name)")
                .lineLimit(1)
                .padding([.leading, .trailing], showCheckbox ? 2 : 8)
            
            Spacer()
            
            if item.isCheckOn {
                OutlineTextField(item: Binding(get: { item.amount > 0 ? String(item.amount) : "" },
                                               set: { if let amount = Double($0) { item.amount = amount } }),
                                 placeholder: "$",
                                 size: CGSize(width: 60, height: 43))
                .padding([.leading, .trailing], 8)
            }
            
        }.frame(height: 43)
    }
}

//#Preview {
//    SimpleItem(item: CartItem(name: "Item", quantity: 1), showCheckbox: false)
//}
