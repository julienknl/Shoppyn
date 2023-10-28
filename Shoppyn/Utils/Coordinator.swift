//
//  Coordinator.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

enum NavigationPage: Hashable, Identifiable {
    case history, setting
    case newShoppingList(isNew: Bool, history: HistoryItem = HistoryItem())
    case inShoppingList(history: HistoryItem)
    case completedShopping(history: HistoryItem)
    
    var id: String {
        return UUID().uuidString
    }
    
}

enum OverFullScreen: String, Identifiable {
    case tutorial
    
    var id: String {
        return UUID().uuidString
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: OverFullScreen?
    
    func push( _ page: NavigationPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: OverFullScreen) {
        self.sheet = sheet
    }
    
    func dismissOverFullScreen() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: NavigationPage) -> some View {
        switch page {
            
        case .history:
            HistoryScene()
            
        case .setting:
            SettingScene()
            
        case .newShoppingList(let isNew, let history):
            NewShoppingListScene(isNew: isNew, historyItem: history)
            
        case .inShoppingList(let history):
            InShoppingListScene(history: history)
            
        case .completedShopping(let history):
            CompletedShoppingScene(history: history)
            
        }
    }
    
    @ViewBuilder
    func build(sheet: OverFullScreen) -> some View {
        switch sheet {
            
        case .tutorial:
            TutorialScene()
            
        }
    }
}
