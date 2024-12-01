//
//  UserDefaults.swift
//  TaskListApp
//
//  Created by Emre Mert on 1.12.2024.
//

import Foundation


extension UserDefaults {
    static let tasksKey = "tasksKey" // Görevleri saklamak için bir anahtar

    /// Görev listesini kaydetmek için bir fonksiyon
    func saveTasks(_ tasks: [String]) {
        set(tasks, forKey: UserDefaults.tasksKey)
    }

    /// Görev listesini yüklemek için bir fonksiyon
    func loadTasks() -> [String] {
        return array(forKey: UserDefaults.tasksKey) as? [String] ?? []
    }
}
