//
//  InShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 11/10/2023.
//

import SwiftUI

struct InShoppingListScene: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @State var history: HistoryItem = HistoryItem()
    @State private var maximumBudget: Double = 0
    @State private var presentError: Bool = false
    
    init(history: HistoryItem) {
        self._history = State(initialValue: history)
        self._maximumBudget = State(initialValue: history.afterBudget ?? 0.0)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                CircularProgressView(progress: $history.progress)
                    .frame(width: geometry.size.width - geometry.size.width/3)
                    .overlay(content: {
                        VStack {
                            Text("Budget: $\(history.initialBudget?.round(to: 2) ?? "NaN")")
                                .foregroundStyle(Colour.main)
                            Text("$\(maximumBudget.round(to: 2)) left")
                        }
                    })
                
                List {
                    ForEach($history.cartItems) { $item in
                        SimpleItem(item: $item, showCheckbox: true)
                            .onSubmit {
                                $maximumBudget.wrappedValue = (history.initialBudget ?? 0.0) - history.cartItems.reduce(0, { $0 + $1.amount })
                                let calculatedProgress = max(0, $maximumBudget.wrappedValue) / (history.initialBudget ?? 0.0)
                                $history.progress.wrappedValue = calculatedProgress
                            }
                            .submitLabel(.done)
                    }
                }
                .listStyle(PlainListStyle())
                .padding([.top])
            }
            .frame(maxWidth: .infinity)
            .onDisappear(perform: {
                updateHistory()
            })
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    presentError = history.cartItems.contains(where: { $0.amount == 0 && $0.isCheckOn })
                    
                    if !presentError {
                        updateHistory(completed: true)
                        coordinator.popToRoot()
                    }
                } label: {
                    Text("Done")
                }
                .alert("Missing amount",
                       isPresented: $presentError,
                       actions: {},
                       message: { Text("Some items have been added to your cart but no amount has been set") })

            }
        }
    }
    
    private func updateHistory(completed: Bool = false) {
        let repository = HistoryRepository(context: _context)
        repository.update(history, afterBudget: maximumBudget, completed: completed)
    }
}

#Preview {
    InShoppingListScene(history: HistoryItem())
}
