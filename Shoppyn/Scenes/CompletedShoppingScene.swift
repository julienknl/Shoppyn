//
//  CompletedShoppingScene.swift
//  Shoppyn
//
//  Created by Julien on 13/10/2023.
//

import SwiftUI

struct CompletedShoppingScene: View {
    
    @State var history: HistoryItem = HistoryItem()
    
    var body: some View {
        
        VStack {
            Text("Completed on \(history.date?.toReadableDate() ?? "NaN")")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(Colour.darkGray)
            
            VStack{
                DynamicDotsText(firstText: "Budget",
                                secondText: "$\(history.initialBudget ?? 0.0)",
                                fontSize: 20)
                .padding([.leading, .trailing])
                
                DynamicDotsText(firstText: "Total spent",
                                secondText: "$\(history.afterBudget ?? 0.0)",
                                fontSize: 20)
                .padding([.leading, .trailing])
                
                DynamicDotsText(firstText: history.overBudget ? "Loss" : "Saved",
                                secondText: "$\((history.initialBudget ?? 0) - (history.afterBudget ?? 0))",
                                fontSize: 20,
                                textColor: history.overBudget ? Color.red : Colour.main)
                .padding([.leading, .trailing])
            }
            .padding()
            .background(Colour.main.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
            
//            VStack {
//                Text("Comment:")
//                    .font(.system(size: 16, weight: .medium))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                
//                Text("Comment section")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            .padding()
//            .background(Colour.main.opacity(0.1))
//            .clipShape(.rect(cornerRadius: 10))
            
            List {
                ForEach($history.cartItems) { $item in
                    SimpleItem(item: $item)
                }
            }
            .listStyle(PlainListStyle())
        }
        .toolbar(.hidden, for: .tabBar)
        
        Spacer()
    }
}

#Preview {
    CompletedShoppingScene()
}
