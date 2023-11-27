//
//  Account.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import Foundation

struct Account: Hashable, Identifiable {
    let id = UUID()
    let name: String
    var amount: Float
    let createdAt: Date
}
