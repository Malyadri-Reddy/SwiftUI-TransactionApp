//
//  TransactionModel.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 08/03/25.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Codable, Hashable {
    
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    let category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpese: Bool
    var isEditing: Bool
    
    var dateParsed: Date {
        date.dateParser()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: {$0.id == categoryId}) {
            return category.icon
        }
        return .question
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var nameCategoryId: Int?
}

extension Category {
    static let autoAndTranspot = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainement = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fess & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, nameCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, nameCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, nameCategoryId: 2)
    static let moviesAndDvds = Category(id: 301, name: "Movies & Dvds", icon: .film, nameCategoryId: 3)
    static let banFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, nameCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "finance charge Transportation", icon: .hand_holding_usd, nameCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, nameCategoryId: 5)
    static let restaurents = Category(id: 502, name: "Restaurents", icon: .utensils, nameCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, nameCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, nameCategoryId: 6)
    static let paycheque = Category(id: 701, name: "paycheque", icon: .dollar_sign, nameCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, nameCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "credit card payment", icon: .exchange_alt, nameCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTranspot,
        .billsAndUtilities,
        .entertainement,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDvds,
        .banFee,
        .financeCharge,
        .groceries,
        .restaurents,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subCategories
}
