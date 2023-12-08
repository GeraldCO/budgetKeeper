//
//  PersistanceController.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 29/11/23.
//

import Foundation
import CoreData

struct PersistenceController {
    //A singleton for our entire app to use
    static let shared = PersistenceController()
    
    //Storage for Core Data
    let container: NSPersistentContainer
    
    //A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        // Create 10 examples of accounts.
        for _ in 0..<10 {
            let account = AccountCD(context: controller.container.viewContext)
            account.name = "Example account 1"
            account.amount = 123
            account.createdAt = Date()
        }
        return controller
    }()
    
    
    //An initializer to load Core Data, optionally able
    //to use an in-memory store
    init(inMemory: Bool = false){
        // if you did not name your model Main you will need
        // to change this name below
        container = NSPersistentContainer(name: "Main")
        
        let account = AccountCD(context: container.viewContext)
        account.name = "Example account 1"
        account.amount = 123
        
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
            
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        
        }
    }
    
    func save() {
        let context = container.viewContext
    print("savessss")
        if context.hasChanges {
            do{
                try
                    context.save()
                    print("saved")
                
            } catch {
                print("Failed saving: \(error)")
            }
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountCD")
           do {
               let result = try context.fetch(fetchRequest)
               for data in result as! [NSManagedObject] {
                   print(data.value(forKey: "name") as! String)
               }
           } catch {
               print("Fetching data Failed")
           }
    }
 
    
}
