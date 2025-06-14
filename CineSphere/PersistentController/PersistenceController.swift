//
//  PersistenceController.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 04/06/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model") 
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Erro ao carregar o Core Data: \(error)")
            }
        }
    }
}

