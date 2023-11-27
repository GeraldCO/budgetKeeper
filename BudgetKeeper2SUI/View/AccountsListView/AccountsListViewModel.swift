//
//  AccountsListViewModel.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 21/11/23.
//

import Foundation

final class AccountsViewModel: ObservableObject{

    @Published var accountsList: [Account] = []
    @Published var isLoading: Bool = false
    
    private var repository: AccountsRepository
    
    init(repository: AccountsRepository){
        self.repository = repository
    }
    
    func loadAccountsList() async {
        await MainActor.run { isLoading = true }
        let fetchedAccounts = await repository.loadAccounts()
        await MainActor.run {
            print("loadiung")
            accountsList = fetchedAccounts
            isLoading = false
        }
    }
    
    func deleteAccount(_ accountId : UUID) async -> Bool {
        let wasDeleted = await repository.deleteAccount(id: accountId)
        if (wasDeleted) {
           await loadAccountsList()
        }
        return wasDeleted
        
    }
}
