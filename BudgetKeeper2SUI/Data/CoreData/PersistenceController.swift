//
//  PersistanceController.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 29/11/23.
//

import Foundation

struct PersistanceController {
    //A singleton for our entire app to use
    static let shared = PersistanceController()
    
    //Storage for Core Data
    let container: NSPersistanceContainer
    
}
