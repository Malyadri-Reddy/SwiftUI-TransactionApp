//
//  SwiftUI_TransactionAppApp.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 08/03/25.
//

import SwiftUI

@main
struct SwiftUI_TransactionAppApp: App {
    @StateObject var transactionListVm = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVm)
        }
    }
}
