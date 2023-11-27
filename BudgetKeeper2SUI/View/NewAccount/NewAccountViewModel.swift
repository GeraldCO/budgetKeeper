//
//  NewAccountViewModel.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 21/11/23.
//

import Foundation

final class NewAccountViewModel: ObservableObject{
    private let repository : AccountsRepository
    @Published var isLoading: Bool = false
    
    init(repository: AccountsRepository) {
        self.repository = repository
    }
    
    func saveAccount(name: String, amount: String) async -> Bool {
        guard let amount = Float(amount) else { return false }
        return await repository.addAccount(Account(name: name, amount: amount, createdAt: Date()))
        
    }
    
}
