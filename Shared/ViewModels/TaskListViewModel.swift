//
//  TodoViewModel.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRowViewModels = [TaskRowViewModel]()

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskRowViewModels = testDataTasks.map{ task in
            TaskRowViewModel(task: task)
        }
    }
    
    func removeTasks(atOffsets indexSet: IndexSet) {
        taskRowViewModels.remove(atOffsets: indexSet)
    }
    
    func addTask(task: Task) {
        taskRowViewModels.append(TaskRowViewModel(task: task))
    }
}
