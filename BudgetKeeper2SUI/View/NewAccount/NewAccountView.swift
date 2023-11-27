//
//  NewAccount.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import SwiftUI

struct NewAccountView: View {
    @State private var newAccount = ""
    @ObservedObject var viewModel : NewAccountViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            TextField("New Account", text: $newAccount)
                .frame(width: 150 )
            Button(action: {
                Task{
                    let wasSaved = await viewModel.saveAccount(name: newAccount, amount: "0.0")
                    
                    if (wasSaved){
                        dismiss()                        
                    }
                }
                
            }, label: {
                Text("Save")
                    .foregroundColor(.purple)
            })
        }
    }
}

#Preview {
    let repo = AccountsRepository(db: MockAccoutDataBase.shared)
    let vm = NewAccountViewModel(repository: repo)
    return NewAccountView(viewModel: vm)
}
