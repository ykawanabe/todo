//
//  TodoApp+Injection.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 4/19/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { LocalTaskRepository() as TaskRepository }.scope(.application)
    }
}
