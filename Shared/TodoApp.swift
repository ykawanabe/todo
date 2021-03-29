//
//  TodoApp.swift
//  Shared
//
//  Created by Yusuke Kawanabe on 3/22/21.
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
