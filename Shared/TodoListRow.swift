//
//  TodoViewListRow.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import SwiftUI

struct TodoListRow: View {
    @ObservedObject var viewModel: TodoListRowViewModel

    init(viewModel: TodoListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack() {
            if viewModel.isCompleted {
                Text("[x]")
            } else {
                Text("[ ]")
            }
            
            Text(viewModel.title)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Text(viewModel.dueString)
        }.onTapGesture {
            self.viewModel.toggleTodoIsCompleted()
        }
    }
}

struct TodoListRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TodoListRowViewModel.fixer()
        TodoListRow(viewModel: viewModel)
    }
}
