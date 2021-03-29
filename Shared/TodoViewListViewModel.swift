//
//  TodoViewModel.swift
//  Todo
//
//  Created by Carolina Minami Oguchi on 3/22/21.
//

import Foundation

class TodoViewListViewModel: ObservableObject, Identifiable {
    
    var title: String = "List"
    @Published var todos: [TodoListRowViewModel]?
    
    // how do i indicate the state? if loaded but failed? Think about it later
    
}

extension TodoViewListViewModel {
    static func fixer() -> TodoViewListViewModel {
        let viewModel = TodoViewListViewModel()
        viewModel.todos = [
            TodoListRowViewModel.fixer(),
            TodoListRowViewModel.fixer(),
            TodoListRowViewModel.fixer()
        ]
        return viewModel
    }
}
