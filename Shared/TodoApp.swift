//
//  TodoApp.swift
//  Shared
//
//  Created by Yusuke Kawanabe on 3/22/21.
//

import SwiftUI
import Firebase
import Resolver

@main
struct TodoApp: App {
    
    @Injected var authenticationService: AuthenticationService

    init() {
        FirebaseApp.configure()
        authenticationService.signIn()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
