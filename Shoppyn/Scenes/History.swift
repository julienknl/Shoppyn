//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct History: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var histories: [HistoryItem] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(histories) { history in
                    SubtitledItem(history: history)
                }
            }
            .frame( maxWidth: .infinity)
            .ignoresSafeArea(.all, edges: [.leading, .trailing])
            .listStyle(PlainListStyle())
        }
        .navigationTitle("History")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    coordinator.push(.newShoppingList(isNew: true))
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
