//
//  AccountDataBaseRepresentable.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import Foundation

protocol AccountDataBaseRepresentable{
    
    func getAllAccounts() -> [Account]
    
    func insertAccount(_ newAccount: Account) -> Bool
    
    func deleteAccount(_ accountId: UUID) -> Bool
    
    func updateAccount(_ acountId: UUID,_ newAmmount: Float) -> Bool
}
