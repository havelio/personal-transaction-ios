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
                Text(transaction.name)
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .padding(.trailing, 16)
            }
            .padding(.vertical, 16)

            Divider()
            HStack() {
                VStack(alignment: .leading ,spacing: 4) {
                    Text("Payment")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    
                    Text(transaction.paymentType.displayName)
                        .font(.system(size: 12))
                }
                Spacer()
                VStack(alignment: .leading ,spacing: 4) {
                    Text("Total")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    
                    Text(transaction.totalDisplay)
                        .font(.system(size: 12))
                }
                Spacer()
                VStack(alignment: .leading ,spacing: 4) {
                    Text("Created")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                    
                    Text(transaction.createdDisplay)
                        .font(.system(size: 12))
                }
            }
            .padding(16)
            .background(Color.gray.opacity(0.1))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
    }
}

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItem(transaction: transactions.first!)
    }
}
