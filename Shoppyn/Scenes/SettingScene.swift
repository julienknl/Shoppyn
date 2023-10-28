//
//  Setting.swift
//  Shoppyn
//
//  Created by Julien on 5/10/2023.
//

import SwiftUI

struct SettingScene: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    private var settings: [Setting] = [Setting(title: "Tutorial")]
    
    var body: some View {
        VStack {
            List {
                ForEach(settings) { setting in
                    Button(action: {
                        coordinator.present(sheet: .tutorial)
                    }, label: {
                        DefaultItem(title: setting.title ?? "NaN")
                    })
                }
            }
        }
        .navigationTitle("Setting")
    }
}

#Preview {
    SettingScene()
}
