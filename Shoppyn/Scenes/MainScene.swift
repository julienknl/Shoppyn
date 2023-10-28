//
//  Main.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct MainScene: View {
    
    @StateObject private var coordinator = Coordinator()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Colour.main)]
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .history)
                .navigationDestination(for: NavigationPage.self, destination: { page in
                    coordinator.build(page: page)
                })
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .tint(Colour.darkGray)
        .environmentObject(coordinator)
    }
}

#Preview {
    MainScene()
}
