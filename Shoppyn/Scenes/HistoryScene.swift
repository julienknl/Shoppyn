//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI
import SwiftData

struct HistoryScene: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var histories: [HistoryItem]
    
    var body: some View {
        VStack {
            if !histories.isEmpty {
                List {
                    ForEach(histories) { history in
                        SubtitledItem(history: history)
                    }
                }
                .frame( maxWidth: .infinity)
                .ignoresSafeArea(.all, edges: [.leading, .trailing])
                .listStyle(PlainListStyle())
            }
            else {
                NoDataView(imageName: "desertimage",
                           title: "NO LIST TO SHOW",
                           subtitle: "Tap on + to add a new list")
            }
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
    HistoryScene()
}
