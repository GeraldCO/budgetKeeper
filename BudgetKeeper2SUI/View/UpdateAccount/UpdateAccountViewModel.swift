//
//  UpdateAccountViewModel.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 24/11/23.
//

import Foundation

final class UpdateAccountViewModel : ObservableObject {
    @Published var account : Account
    private let repository = AccountsRepository(db: MockAccoutDataBase.shared)
    @Published var isLoading = false
    
    init(account: Account) {
        self.account = account
    }
    
    func updateAccpount(_ id: UUID,_ amount: String) async -> Bool{
        guard let amount = Float(amount) else { return false }
        return await repository.updateAccount(id, amount) 
    }
}
