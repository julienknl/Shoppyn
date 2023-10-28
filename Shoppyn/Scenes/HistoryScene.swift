//
//  History.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI
import SwiftData

struct HistoryScene: View {
    @AppStorage("hasShownTutorial") var hasShownTutorial = false
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var histories: [HistoryItem]
    
    var body: some View {
        VStack {
            
            if !histories.isEmpty {
                List {
                    ForEach(histories.sorted(by: { $0.date ?? Date() > $1.date ?? Date() })) { history in
                        Button(action: {
                            if history.completed {
                                coordinator.push(.completedShopping(history: history))
                            }
                            else {
                                coordinator.push(.inShoppingList(history: history))
                            }
                        }, label: {
                            SubtitledItem(history: history)
                        })
                    }
                    .onDelete(perform: { indexes in
                        for index in indexes {
                            deleteItem(histories[index])
                        }
                    })
                    
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
    
    private func deleteItem(_ history: HistoryItem) {
        let repository = HistoryRepository(context: _context)
        repository.delete(history)
    }
}

#Preview {
    HistoryScene()
}
