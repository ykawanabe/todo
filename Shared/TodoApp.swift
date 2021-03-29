//
//  TodoApp.swift
//  Shared
//
//  Created by Carolina Minami Oguchi on 3/22/21.
//

import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = TodoViewListViewModel.fixer()
            TodoViewListView(viewModel: viewModel)
        }
    }
}
