//
//  TaskRowView.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var taskRowViewModel: TaskRowViewModel
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }
    @State var isEditing = false

    
    var body: some View {
        HStack {
            Image(systemName: taskRowViewModel.completionStateIconName )
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskRowViewModel.task.isCompleted.toggle()
                    
                    if !isEditing {
                        self.onCommit(.success(self.taskRowViewModel.task))
                    }
                }
            
            TextField("Enter task title", text: $taskRowViewModel.task.title) { isEditing in
                self.isEditing = isEditing
            }
            onCommit: {
                if self.taskRowViewModel.task.title.isEmpty {
                    self.onCommit(.failure(.empty))
                } else {
                    self.onCommit(.success(self.taskRowViewModel.task))
                }
            }
        }
    }
}

enum InputError: Error {
    case empty
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let task = testDataTasks[0]
        let taskRowViewModel = TaskRowViewModel(task: task)
        TaskRowView(taskRowViewModel: taskRowViewModel).previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
