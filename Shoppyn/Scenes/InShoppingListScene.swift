//
//  InShoppingList.swift
//  Shoppyn
//
//  Created by Julien on 11/10/2023.
//

import SwiftUI

struct InShoppingListScene: View {
    
    @State private var progress: Double = 0
    @State private var maximumBudget: Double = 0
    private var staticBudget: Double = 0
    @State private var presentError: Bool = false
    @State private var items: [CartItem] = []
    
    init(budget: Double) {
        self._maximumBudget = State(initialValue: budget)
        self._progress = State(initialValue: budget/1)
        staticBudget = budget
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                CircularProgressView(progress: $progress)
                    .frame(width: geometry.size.width - geometry.size.width/3)
                    .overlay(content: {
                        VStack {
                            Text("Budget: $\(staticBudget.round(to: 2))")
                                .foregroundStyle(Colour.main)
                            Text("$\(maximumBudget.round(to: 2)) left")
                        }
                    })
                
                List {
                    ForEach($items) { $item in
                        SimpleItem(item: $item, showCheckbox: true)
                            .onSubmit {
                                $maximumBudget.wrappedValue = staticBudget - items.reduce(0, { $0 + $1.amount })
                                let calculatedProgress = max(0, $maximumBudget.wrappedValue) / staticBudget
                                $progress.wrappedValue = calculatedProgress
                            }
                            .submitLabel(.done)
                    }
                }
                .listStyle(PlainListStyle())
                .padding([.top])
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    presentError = items.contains(where: { $0.amount == 0 && $0.isCheckOn })
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
}

#Preview {
    InShoppingListScene(budget: 700)
}
