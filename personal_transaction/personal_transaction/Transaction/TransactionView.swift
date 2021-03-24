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
                        Text("Don't forget to save your money for investment")
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity)
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
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }))
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
