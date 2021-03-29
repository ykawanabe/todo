//
//  TodoListRowViewModel.swift
//  Todo
//
//  Created by Carolina Minami Oguchi on 3/22/21.
//

import Foundation

class TodoListRowViewModel: ObservableObject {
    private var todo: Todo
    
    var title: String {
        return todo.title
    }
    
    var dueString: String {
        guard let due = todo.dueBy else { return "--/--/--" }
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: due)
    }
    
    var isCompleted: Bool {
        return todo.isCompleted
    }
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    func toggleTodoIsCompleted() {
        todo.isCompleted.toggle()
    }
}

extension TodoListRowViewModel: Identifiable {
    var id: UUID {
        return self.todo.id
    }
}

extension TodoListRowViewModel {
    static func fixer() -> TodoListRowViewModel {
        return TodoListRowViewModel(todo: Todo.fixer())
    }
}
