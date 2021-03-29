//
//  Todo.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: UUID
    var title: String
    var dueBy: Date?
    var isCompleted: Bool
}


extension Todo {
    static func fixer() -> Todo {
        return Todo(id: UUID(),
                    title: "Title",
                    dueBy: Date(),
                    isCompleted: false)
    }
}
