//
//  CompletedShoppingScene.swift
//  Shoppyn
//
//  Created by Julien on 13/10/2023.
//

import SwiftUI

struct CompletedShoppingScene: View {
    
    var title: String = ""
    @State var items: [CartItem] = []
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(Colour.darkGray)
            
            VStack{
                DynamicDotsText(firstText: "Budget", secondText: "$70", fontSize: 20)
                    .padding([.leading, .trailing])
                
                DynamicDotsText(firstText: "Total spent", secondText: "$70", fontSize: 20)
                    .padding([.leading, .trailing])
                
                DynamicDotsText(firstText: "Saved", secondText: "$70", fontSize: 20)
                    .padding([.leading, .trailing])
            }
            .padding()
            .background(Colour.main.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
            
            VStack {
                Text("Comment:")
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Comment section")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Colour.main.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
            
            List {
                ForEach($items) { $item in
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
