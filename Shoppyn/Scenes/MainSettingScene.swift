//
//  MainSettingScene.swift
//  Shoppyn
//
//  Created by Julien on 28/10/2023.
//

import SwiftUI

struct MainSettingScene: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .setting)
                .navigationDestination(for: NavigationPage.self, destination: { page in
                    coordinator.build(page: page)
                })
                .fullScreenCover(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .tint(Colour.darkGray)
        .environmentObject(coordinator)
    }
}

#Preview {
    MainSettingScene()
}
