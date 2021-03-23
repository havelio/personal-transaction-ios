//
//  TransactionView.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    HStack(alignment: .top, spacing: 9) {
                        Image(systemName: "i.circle")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .padding(.top, 2)
                        Text("Get a change for automatic limit increase by always paying on time")
                            .font(.system(size: 12))
                    }
                    .padding(16)
                    .background(Color(.sRGB, red: 255, green: 210, blue: 0, opacity: 1))
                    .cornerRadius(7)

                    ForEach(transactions, id: \.id) { transaction in
                        NavigationLink(
                            destination: TransactionDetailView(transaction: transaction),
                            label: {
                                TransactionItem(transaction: transaction)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.vertical, 16)
            }
            .navigationBarTitle("Transactions", displayMode: .inline)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
