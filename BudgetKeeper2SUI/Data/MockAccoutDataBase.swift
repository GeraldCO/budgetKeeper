//
//  MockAccoutDataBase.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import Foundation

final class MockAccoutDataBase: AccountDataBaseRepresentable{
    
    
    static var shared = MockAccoutDataBase()
    
    private init(){ }
    
    private var accountsList: [Account] = [
        Account(name: "Cable", amount:  15.2, createdAt: Date()),
        Account(name: "Internet", amount:  24.5, createdAt: Date()),
        Account(name: "Grocery", amount:  154.22, createdAt: Date())
    ]
    
    func getAllAccounts() -> [Account] {
        return accountsList
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
