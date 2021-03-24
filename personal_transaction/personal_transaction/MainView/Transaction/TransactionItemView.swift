//
//  TransactionItem.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct TransactionItem: View {
    
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 45, height: 45)
                    .padding(.leading, 16)
                LabelView(transaction.name)
                    .lineLimit(2)
                    .padding(.trailing, 16)
            }
            .padding(.vertical, 16)

            Divider()
            HStack() {
                VStack(alignment: .leading ,spacing: 4) {
                    LabelView("Payment", type: .smallSecondary)
                    LabelView(transaction.paymentType.displayName, type: .small)
                }
                Spacer()
                VStack(alignment: .leading ,spacing: 4) {
                    LabelView("Total", type: .smallSecondary)
                    LabelView(transaction.totalDisplay, type: .small)
                }
                Spacer()
                VStack(alignment: .leading ,spacing: 4) {
                    LabelView("Created", type: .smallSecondary)
                    LabelView(transaction.createdDisplay, type: .small)
                }
            }
            .padding(16)
            .background(Color.secondrayGrey)
        }
        .cornerBorder(radius: 8)
        .padding(.vertical, 5)
    }
}

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItem(transaction: transactions.first!)
    }
}
