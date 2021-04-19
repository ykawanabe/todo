//
//  TaskRepository.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 4/19/21.
//

import Foundation

class BaseTaskRepository {
    @Published var tasks = [Task]()
}

protocol TaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
}

class TestDataTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject{
    override init() {
        super.init()
        tasks = testDataTasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task
        }
    }
}
