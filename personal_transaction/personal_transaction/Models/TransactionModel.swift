//
//  TransactionModel.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import Foundation

struct Transaction: Identifiable {
    
    enum PaymentType: Int {
        case cash,
             creditCard,
             debitCard,
             eWallet
        
        var displayName: String {
            switch self {
            case .cash: return "Cash"
            case .creditCard: return "Credit Card"
            case .debitCard: return "Debit Card"
            case .eWallet: return "E-Wallet"
            }
        }
    }
    
    let id = UUID()
    let name: String
    let paymentTypeValue: Int
    let total: Double
    let created: Date

    var totalDisplay: String {
        let formatter = NumberFormatter()
        formatter.groupingSize = 3
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.numberStyle = .decimal
        return "Rp " + formatter.string(from: .init(value: total))!
    }
    
    var createdDisplay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: created) 
    }
    
    var paymentType: PaymentType {
        return PaymentType(rawValue: paymentTypeValue) ?? .cash
    }
    
    init(name: String, paymentTypeValue: Int, total: Double, created: Date) {
        self.name = name
        self.paymentTypeValue = paymentTypeValue
        self.total = total
        self.created = created
    }
}

// dumy data
let transactions = [
    Transaction(name: "Belanja di Tokopedia VTAYYA Air boom Pro 2", paymentTypeValue: 3, total: 14000, created: Date()),
    Transaction(name: "Belanja di Bukalapak VTAYYA Air boom Pro 2", paymentTypeValue: 0, total: 100000, created: Date()),
    Transaction(name: "Belanja di Lazada VTAYYA Air boom Pro 2", paymentTypeValue: 0, total: 84000, created: Date()),
    Transaction(name: "Belanja di Tiket.com VTAYYA Air boom Pro 2", paymentTypeValue: 1, total: 124000, created: Date()),
    Transaction(name: "Belanja di Shoppie VTAYYA Air boom Pro 2", paymentTypeValue: 2, total: 92000, created: Date())
]
