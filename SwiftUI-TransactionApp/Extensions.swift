//
//  Extensions.swift
//  SwiftUI-TransactionApp
//
//  Created by Malyadri Reddy on 08/03/25.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundColor = Color("Background")
    static let iconColor = Color("Icon")
    static let textColor = Color("Text")
    static let systemBackground = Color(.systemBackground)
}

extension DateFormatter {
    
    static let allNumericUSA: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    
    func dateParser() -> Date {
        guard let parseDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        
        return parseDate
    }
}
