//
//  BudgetKeeper2SUIApp.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import SwiftUI

@main
struct BudgetKeeper2SUIApp: App {
    var body: some Scene {
        WindowGroup {
            let repo = AccountsRepository(db: MockAccoutDataBase.shared)
            let vm = AccountsViewModel(repository: repo)
            AccountsListView(viewModel: vm)
        }
    }
}
