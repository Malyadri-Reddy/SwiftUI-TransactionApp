//
//  ContentView.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 08/03/25.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        
        var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
        NavigationView {
            ScrollView(){
                VStack(alignment: .leading, spacing: 24){
                    //Mark: title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    LineChartView(data: demoData, title: "").frame(width: 300, height: 300, alignment: .center)
                        
                    
                    //Mark: Transaction list
                    RecetTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //Mark: notification icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

#Preview {
    
    let transactionListVm: TransactionListViewModel = {
       let transactionListVm = TransactionListViewModel()
       transactionListVm.transactions = transactionListPreviewData
       return transactionListVm
   }()
    ContentView()
        .environmentObject(transactionListVm)
}
