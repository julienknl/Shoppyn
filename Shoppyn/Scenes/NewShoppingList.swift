//
//  NewShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct NewShoppingList: View {
    
    var body: some View {
        
        VStack {
            Text("New shopping view")
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Text("Edit")
                })
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
