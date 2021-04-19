//
//  TaskListView.swift
//  Shared
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListViewModel = TaskListViewModel()
    @State var presentAddNewItem = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListViewModel.taskRowViewModels) { taskRowViewModel in
                        TaskRowView(taskRowViewModel: taskRowViewModel)
                    }
                    .onDelete { indexSet in
                        self.taskListViewModel.removeTasks(atOffsets: indexSet)
                    }
                    if presentAddNewItem {
                        TaskRowView(taskRowViewModel: TaskRowViewModel.newTask()) {
                            result in
                            if case .success(let task) = result {
                                self.taskListViewModel.addTask(task: task)
                            }
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle() }, label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("New Task")
                    }
                })
                .padding()
                .accentColor(Color(UIColor.systemRed))
            }
        }
        .navigationBarTitle("Tasks")
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
