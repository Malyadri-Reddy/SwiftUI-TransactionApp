//
//  TransactionList.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 09/03/25.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionVm : TransactionListViewModel
    var body: some View {
        
        VStack() {
            
            List{
                ForEach(Array(transactionVm.groupTransactionBymonth()), id: \.key){ month, transactions in
                    
                    Section{
                        
                        ForEach(transactions){ transaction in
                            TransactionView(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    let transactionListVm: TransactionListViewModel = {
       let transactionListVm = TransactionListViewModel()
       transactionListVm.transactions = transactionListPreviewData
       return transactionListVm
   }()
    NavigationView {
        TransactionList()
            .environmentObject(transactionListVm)
    }
}
