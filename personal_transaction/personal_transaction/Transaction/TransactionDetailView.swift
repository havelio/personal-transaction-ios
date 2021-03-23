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
                        Text("Transaction detials")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
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
                    .background(Color.blue.opacity(0.04))
                    
                    if !hideTransaction {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(spacing: 25) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Payment")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    
                                    Text(transaction.paymentType.displayName)
                                        .font(.system(size: 12))
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Created")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    
                                    Text(transaction.createdDisplay)
                                        .font(.system(size: 12))
                                }
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Total")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Text(transaction.totalDisplay)
                                    .font(.system(size: 12))
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Make Payment")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(1)
                        })
                        .padding(.top, 8)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
        }
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)

        }), trailing: Button(action: {
            
        }, label: {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.white)
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
