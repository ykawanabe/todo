//
//  ContentView.swift
//  Shared
//
//  Created by Carolina Minami Oguchi on 3/22/21.
//

import SwiftUI

struct TodoViewListView: View {
    @ObservedObject var viewModel: TodoViewListViewModel
    
    init(viewModel: TodoViewListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                if let todos = viewModel.todos {
                    listSection(for: todos)
                } else {
                    emptySection
                }
            }
            .navigationBarTitle(viewModel.title)
        }
    }
}

private extension TodoViewListView {
    func listSection(for viewModels: [TodoListRowViewModel]) -> some View {
        Section {
            ForEach(viewModels, content: TodoListRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}

struct TodoViewListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TodoViewListViewModel.fixer()
        TodoViewListView(viewModel: viewModel)
    }
}
