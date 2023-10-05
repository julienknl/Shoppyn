//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct History: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("History element")
        }
        .navigationTitle("History")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    coordinator.push(.newShoppingList)
                }) {
                    Image(uiImage: UIImage(named: "addicon") ?? UIImage())
                }
            }
        }
        
    }
}

#Preview {
    History()
}
