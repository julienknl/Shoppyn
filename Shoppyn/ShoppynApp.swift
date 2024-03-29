//
//  ShoppynApp.swift
//  Shoppyn
//
//  Created by Julien on 3/10/2023.
//

import SwiftUI
import SwiftData

@main
struct ShoppynApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                
                Main()
                    .tabItem { Image(uiImage: UIImage(named: "mainicon") ?? UIImage()) }
                
                Setting()
                    .tabItem { Image(uiImage: UIImage(named: "moreicon") ?? UIImage()) }
            }
            .tint(Colour.main)
        }
        .modelContainer(sharedModelContainer)
    }
}
