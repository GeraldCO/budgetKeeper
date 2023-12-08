//
//  BudgetKeeper2SUIApp.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import SwiftUI
import CoreData

@main
struct BudgetKeeper2SUIApp: App {
    let persistenceController = PersistenceController.shared
    let context: NSManagedObjectContext
    let mockAccountDatabase: MockAccoutDataBase
    
    init(){
        self.context = persistenceController.container.viewContext
        self.mockAccountDatabase = MockAccoutDataBase(context: context)
    }
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            let repo = AccountsRepository(db: mockAccountDatabase)
            let vm = AccountsViewModel(repository: repo)
            AccountsListView(viewModel: vm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _, _ in
            persistenceController.save()
            
        }
    }
}
