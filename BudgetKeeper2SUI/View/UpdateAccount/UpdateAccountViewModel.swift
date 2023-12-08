//
//  UpdateAccountViewModel.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 24/11/23.
//

import Foundation
import CoreData

final class UpdateAccountViewModel : ObservableObject {
    @Published var account : Account
    
    
    let persistenceController = PersistenceController.shared
    let context: NSManagedObjectContext
    let mockAccountDatabase: MockAccoutDataBase
    
    
    private let repository : AccountsRepository
    @Published var isLoading = false
    
    init(account: Account) {
        self.account = account
        self.context = persistenceController.container.viewContext
        self.mockAccountDatabase = MockAccoutDataBase(context: context)
        self.repository = AccountsRepository(db: mockAccountDatabase)
    }
    
    func updateAccpount(_ id: UUID,_ amount: String) async -> Bool{
        guard let amount = Float(amount) else { return false }
        return await repository.updateAccount(id, amount) 
    }
}
