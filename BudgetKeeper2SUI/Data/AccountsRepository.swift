//
//  AccountsRepository.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import Foundation
import CoreData

final class AccountsRepository{
    private let db: AccountDataBaseRepresentable
    
    init(db: AccountDataBaseRepresentable){
        self.db = db
    }
    
    func loadAccounts() async -> [AccountCD] {
       //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        return db.getAllAccounts()
    }
    
    func addAccount(_ account: Account) async -> Bool {
        //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        let success = db.insertAccount(account)
        if success {
            print("The account has been added correctly: \(account.name))")
        }
        return success
    }
    
    func deleteAccount(id: UUID) async -> Bool{
        //TODO: implement delete account func
        //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        let wasDeleted = db.deleteAccount(id)
        if wasDeleted{
            print("The account was deleted correctly \(id)")
        }
        return wasDeleted
    }
    
    func updateAccount(_ id: UUID,_ amount: Float) async -> Bool {
        //simulating a network call
        try? await Task.sleep(for: .seconds(1))
        let wasUpdate = db.updateAccount(id, amount)
        if wasUpdate{
            print("Account has been update propertly \(id)")
        }
        return wasUpdate
    }
}
