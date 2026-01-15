//
//  Talking_ApronApp.swift
//  Talking Apron
//
//  Created by Naima Khan on 07/01/2026.
//

import SwiftUI
import SwiftData

@main
struct Talking_ApronApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
//            Item.self,
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
            MainPageView()
        }
        .modelContainer(sharedModelContainer)
    }
}
