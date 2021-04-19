//
//  TaskRowViewModel.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import Foundation
import Combine

class TaskRowViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    @Published var completionStateIconName = ""
    
    var id = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    static func newTask() -> TaskRowViewModel {
        return TaskRowViewModel(task: Task(id: "", title: "", isCompleted: false, dueDate: nil, priority: .medium))
    }
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { $0.isCompleted ? "checkmark.circle.fill" : "circle" }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellable)
        
        $task
            .map { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellable)
    }
}
