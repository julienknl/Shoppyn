//
//  Coordinator.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

enum NavigationPage: String, Identifiable {
    case history, newShoppingList
    
    var id: String {
        self.rawValue
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
            History()
            
        case .newShoppingList:
            NewShoppingList()
            
        }
    }
}
