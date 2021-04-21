//
//  TaskRepository.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 4/19/21.
//

import Foundation
import Disk

class BaseTaskRepository {
    @Published var tasks = [Task]()
}

protocol TaskRepository: BaseTaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
}

class LocalTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    private let fileName = "tasks.json"
    
    override init() {
        super.init()
        loadData()
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
        saveData()
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: {  $0.id == task.id }) {
            tasks.remove(at: index)
        }
        saveData()
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: {  $0.id == task.id }) {
            tasks[index] = task
        }
        
        saveData()
    }
    
    private func loadData() {
        if let retrievedTasks = try? Disk.retrieve(fileName, from: .documents, as: [Task].self) {
            tasks = retrievedTasks
        }
    }
    
    private func saveData() {
        do {
            try Disk.save(tasks, to: .documents, as: fileName)
        } catch let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
            """)
        }
    }
}

class TestDataTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
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
