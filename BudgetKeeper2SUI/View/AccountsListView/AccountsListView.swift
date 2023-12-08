//
//  ContentView.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 17/11/23.
//

import SwiftUI

struct AccountsListView: View {
    @ObservedObject var viewModel: AccountsViewModel
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
        SortDescriptor(\.amount)
    ]) var accounts: FetchedResults<AccountCD>
    
    
    
    @ViewBuilder
    private var topHeader: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                
//                NavigationLink(destination: {
//                    //navigate
//                    let repo = AccountsRepository(db: MockAccoutDataBase)
//                    let vm = NewAccountViewModel(repository: repo)
//                    NewAccountView(viewModel: vm)
//                }, label: {
//                    Image(systemName: "plus")
//                        .renderingMode(.template)
//                        .foregroundStyle(.purple)
//                        .imageScale(.large)
//                        .frame(width: 40, height: 40)
//                })
            }
            
            //Title
            Text("Budget Keeper")
                .font(.title)            
        }
        .padding()
    }
    
    private func deleteAccount(at offsets: IndexSet){
        offsets.forEach { index in
            let account = viewModel.accountsList[index]
            Task {
                let success = await viewModel.deleteAccount(account.id!)
                if success {
                    print("Account successfully deleted")
                } else {
                    print("Failed to delete account")
                }
            }
            
        }
    }
    
    @ViewBuilder
    private var accountsList: some View{
        List{
            ForEach(viewModel.accountsList, id: \.id) { account in
                NavigationLink(destination: {
                    let vm = UpdateAccountViewModel(account: account)
                    UpdateAccountView(viewModel: vm)
                }, label: { AccountListItem(account: account)
                    .contentShape(Rectangle()) })
                .padding(.trailing, -32)
                .listRowSeparator(.hidden)
            }.onDelete(perform: deleteAccount)
        }
        .listStyle(PlainListStyle())
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                topHeader
                
                
                List(accounts) { account in
                    Text(account.name ?? "Unknown")
                }
                Spacer()
            }.onAppear(){
                Task{
                    await viewModel.loadAccountsList()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        let context = persistenceController.container.viewContext
        let repo = AccountsRepository(db: MockAccoutDataBase(context: context))
        let vm = AccountsViewModel(repository: repo)
        AccountsListView(viewModel: vm)
    }
}


