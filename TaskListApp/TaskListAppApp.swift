//
//  TaskListAppApp.swift
//  TaskListApp
//
//  Created by Emre Mert on 30.11.2024.
//

import SwiftUI

@main
struct TaskListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
