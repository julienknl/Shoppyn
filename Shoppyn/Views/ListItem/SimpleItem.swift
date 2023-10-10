//
//  SimpleItem.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import SwiftUI

struct SimpleItem: View {
    
    var title: String
    var count: Int
    var amount: Double
    var showCheckbox: Bool = false
    @State var isCheckOn: Bool = false
    
    var body: some View {
        HStack {
            
            if showCheckbox {
                CheckBox(isOn: $isCheckOn)
                    .padding([.leading], 8)
            }
            
            Text("\(count) x \(title)")
                .lineLimit(1)
                .padding([.leading, .trailing], showCheckbox ? 2 : 8)
            
            Spacer()
            
            Text(amount > 0 ? "\(amount.round(to: 2))" : "")
                .lineLimit(1)
                .padding([.leading, .trailing], 8)
            
        }.frame(height: 43)
    }
}

#Preview {
    SimpleItem(title: "Item", count: 1, amount: 0.0, showCheckbox: false)
}
