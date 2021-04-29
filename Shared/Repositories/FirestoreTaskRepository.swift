//
//  FirestoreTaskRepository.swift
//  Todo
//
//  Created by Yusuke Kawanabe on 4/22/21.
//

import Foundation
import FirebaseFirestore
import Resolver
import Combine

class FirestoreTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    
    @Injected var authenticationService: AuthenticationService
    var userId: String = "unknown"

    private var db = Firestore.firestore()
    private let tasksCollectionName = "tasks"
    
    private var cancellables = Set<AnyCancellable>()
        
    override init() {
        super.init()
        
        authenticationService.$user
            .compactMap { $0?.uid }
            .assign(to: \.userId, on: self)
            .store(in: &cancellables)
        
        
        loadData()
    }
    
    private func loadData() {
        db.collection(tasksCollectionName).order(by: "createdTime").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document -> Task? in
                    try? document.data(as: Task.self)
                }
            }
            
        }
    }
    
    func addTask(_ task: Task) {
        do {
            let _ = try db.collection(tasksCollectionName).addDocument(from: task)
        }
        catch {
            print("There was an error while trying to save a task \(error.localizedDescription).")
        }
    }
    
    func removeTask(_ task: Task) {
        if let taskID = task.id {
            db.collection(tasksCollectionName).document(taskID).delete() { error in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection(tasksCollectionName).document(taskID).setData(from: task)
            } catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }
    
}
