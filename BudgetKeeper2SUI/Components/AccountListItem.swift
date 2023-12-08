//
//  AccountListItem.swift
//  BudgetKeeper2SUI
//
//  Created by Gerald on 20/11/23.
//

import SwiftUI

struct AccountListItem: View {
    var account: AccountCD
    private func formattedDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(account.name ?? "").font(.title)
                Text("Created at: \(formattedDate(date: account.createdAt ?? Date()))")
            }
            HStack{
                Spacer()
                Text("$ " + String(account.amount))
            }.frame(width: 100 ,height: 100)
            
        }.foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color.purple,
                            Color.purple.opacity(0.8)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )))
            .font(.title3)
    }
}

#Preview {
    AccountListItem(account: AccountCD(entity: <#T##NSEntityDescription#>, insertInto: <#T##NSManagedObjectContext?#>))
}
