//
//  RecetTransactionList.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 09/03/25.
//

import SwiftUI

struct RecetTransactionList: View {
    @EnvironmentObject var transactionListVm : TransactionListViewModel
    
    var body: some View {
        
        VStack() {
            
            HStack(){
                //Mark: Header Tile
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                //Mark: Header lionk
                NavigationLink{
                    
                }label: {
                    HStack(spacing: 4){
                        
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            //Mark: Recet Transactions List
            ForEach(Array(transactionListVm.transactions.prefix(5).enumerated()), id: \.element){index, transaction in
                TransactionView(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y:5)
    }
}

#Preview {
    
     let transactionListVm: TransactionListViewModel = {
        let transactionListVm = TransactionListViewModel()
        transactionListVm.transactions = transactionListPreviewData
        return transactionListVm
    }()
    
    RecetTransactionList()
        .environmentObject(transactionListVm)
}
