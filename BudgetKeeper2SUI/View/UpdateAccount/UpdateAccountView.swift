//
//  UpdateAccountView.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 24/11/23.
//

import SwiftUI

struct UpdateAccountView: View {
    @State private var accountAmmount = ""
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel : UpdateAccountViewModel
    
    init(viewModel: UpdateAccountViewModel){
        self.viewModel = viewModel
        _accountAmmount = State(initialValue: String(viewModel.account.amount))
    }
    
    var body: some View {
        VStack{
            Text("Update Account")
                .font(.title)
            Spacer()
            Text(viewModel.account.name)
            TextField("Amount", text: $accountAmmount)
                .frame(width: 150 )
                .onChange(of: accountAmmount){ oldValue,  newValue in
                    if let newAmount = Float(newValue)  {
                        Task{
                           _ = await viewModel.updateAccpount( viewModel.account.id, String(newAmount))
                        }
                        
                    }
                    
                }
            Button("Update") {
                    dismiss()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

#Preview{
    let repo = AccountsRepository(db: MockAccoutDataBase.shared)
    let vm = UpdateAccountViewModel(account: Account(name: "gerald", amount: 22.3, createdAt: Date()))
    return UpdateAccountView(viewModel: vm)
}
