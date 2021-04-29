//
//  AuthenticationService.swift
//  Todo (iOS)
//
//  Created by Yusuke Kawanabe on 4/24/21.
//

import Foundation
import FirebaseAuth

class AuthenticationService: ObservableObject {
    @Published var user: User?
    
    func signIn() {
        registerStateListener()
        Auth.auth().signInAnonymously()
    }
    
    private func registerStateListener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            print("Sign in state has changed.")
            self.user = user
            
            if let u = user {
                let anonymous = u.isAnonymous ? "anonymously" : ""
                print("User signed in \(anonymous) with user ID \(u.uid).")
            } else {
                print("User signed out.")
            }
        }
    }
}
