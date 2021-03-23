//
//  TransactionDetailView.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var hideTransaction = false
    
    let transaction: Transaction

    var body: some View {
        ScrollView {
            LazyVStack {
                VStack(spacing: 12) {
                    HStack {
                        LabelView("Transaction Detials", type: .title)
                        Spacer()
                        Button(action: {
                            self.hideTransaction = !hideTransaction
                            
                        }, label: {
                            if hideTransaction {
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.black)

                            } else {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.black)
                            }
                        })
                    }
                    .padding(16)
                    .background(Color.secondaryBlue)
                    
                    if !hideTransaction {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(spacing: 25) {
                                VStack(alignment: .leading, spacing: 5) {
                                    LabelView("Payment", type: .smallSecondary)
                                    LabelView(transaction.paymentType.displayName, type: .small)
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    LabelView("Created", type: .smallSecondary)
                                    LabelView(transaction.createdDisplay, type: .small)
                                }
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                LabelView("Total", type: .smallSecondary)
                                LabelView(transaction.totalDisplay, type: .small)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        Button(action: {
                            
                        }, label: {
                            LabelView("Make Payment")
                                .foregroundColor(.white)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(1)
                        })
                        .padding(.top, 8)
                    }
                }
                .cornerBorder()
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
        }
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(action: {
            self.presentationMode.wrappedValue.dismiss()
        }), trailing: HelpButtonView(action: {
            
        }))
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionDetailView(transaction: transactions.first!)
        }
    }
}
