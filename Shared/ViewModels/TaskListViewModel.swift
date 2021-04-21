//
//  TodoViewModel.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import Foundation
import Combine
import Resolver

class TaskListViewModel: ObservableObject {
    @Published var taskRepository: TaskRepository = Resolver.resolve()
    @Published var taskRowViewModels = [TaskRowViewModel]()

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks
            .map { tasks in
                tasks.map { TaskRowViewModel(task: $0) }
            }
            .assign(to: \.taskRowViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func removeTasks(atOffsets indexSet: IndexSet) {
        let viewModels = indexSet.lazy.map { self.taskRowViewModels[$0] }
        viewModels.forEach { taskRowViewModel in
            taskRepository.removeTask(taskRowViewModel.task)
        }
    }
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
    }
    
    func updateTask(task: Task) {
        taskRepository.updateTask(task)
    }
}
