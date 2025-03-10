//
//  PreviewData.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 08/03/25.
//

import Foundation

var transactionPreviewData = Transaction(
    id: 1,
    date: "08/03/2025",
    institution: "Desjardins",
    account: "Visa Desjardins",
    merchant: "Apple",
    amount: 11.49,
    type: "credit",
    categoryId: 801,
    category: "Software",
    isPending: false,
    isTransfer: false,
    isExpese: true,
    isEditing: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
