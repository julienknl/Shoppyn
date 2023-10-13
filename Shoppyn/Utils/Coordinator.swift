//
//  Coordinator.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

enum NavigationPage: Hashable, Identifiable {
    case history
    case newShoppingList(isNew: Bool)
    case inShoppingList(budget: Double)
    
    var id: String {
        return UUID().uuidString
    }
    
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push( _ page: NavigationPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: NavigationPage) -> some View {
        switch page {
            
        case .history:
            HistoryScene()
            
        case .newShoppingList(let isNew):
            NewShoppingListScene(isNew: isNew)
            
        case .inShoppingList(let budget):
            InShoppingListScene(budget: budget)
            
        }
    }
}
