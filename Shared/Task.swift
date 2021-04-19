//
//  Todo.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import Foundation

enum TaskPriority {
    case high
    case medium
    case low
}

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var priority: TaskPriority?
}

#if DEBUG
let testDataTasks = [
    Task(title: "Task 1", isCompleted: false),
    Task(title: "Task with longer name. This has longer name.", isCompleted: true),
    Task(title: "Emoji 😃", isCompleted: false),
    Task(title: "Task completed", isCompleted: true, dueDate: Date(), priority: .high)
]
#endif
