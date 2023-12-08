//
//  MockAccoutDataBase.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import Foundation
import CoreData
import SwiftUI

final class MockAccoutDataBase: AccountDataBaseRepresentable{
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    private var accountsList: [Account] = [
        
    ]
    
    func getAllAccounts() -> [AccountCD] {
        let fetchRequest: NSFetchRequest<AccountCD> = AccountCD.fetchRequest()
        do{
            let accounts = try context.fetch(fetchRequest)
            return accounts
        } catch {
            print("failed to fetch accounts: \(error)")
            return []
        }
    }
    
    func insertAccount(_ newAccount: Account) -> Bool {
        accountsList.append(newAccount)
        return true
    }
    
    func deleteAccount(_ accountId: UUID) -> Bool {
        if let i = accountsList.firstIndex(where: { $0.id == accountId}){
            accountsList.remove(at: i)
            return true
        }else{
            return false
        }
    }
    
    func updateAccount(_ accountId: UUID, _ newAmmount: Float) -> Bool {
        //TODO: implement this func
        if let i = accountsList.firstIndex(where: { $0.id == accountId}){
            accountsList[i].amount = newAmmount
            return true
        }else {
            return false
        }
    }
        
}
