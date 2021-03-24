//
//  TransactionView.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack(alignment: .top, spacing: 0) {
                    Image(systemName: "i.circle")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .padding(.top, 2)
                        .foregroundColor(.black)
                    LabelView("Don't forget to save your money for investment", type: .small)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                }
                .padding(16)
                .background(Color.secondaryYellow)
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
            .padding(16)
        }
        .navigationBarTitle("Transactions", displayMode: .inline)
        .navigationBarItems(trailing: NavigationLink(
                                destination: TransactionAddView(),
                                label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }))
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionView()
        }
    }
}
