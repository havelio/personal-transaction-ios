//
//  TransactionDetailView.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    
    let transaction: Transaction
    
    var createdComp: [String] {
        return transaction.createdDisplay.components(separatedBy: " ")
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                VStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text(transaction.name)
                                .font(.title3)
                                .lineLimit(.max)
                            
                        }
                        
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.gray)
                            .frame(maxWidth: .infinity, idealHeight: 140)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            LabelView("Notes:", type: .smallSecondary)
                            LabelView(transaction.notes, type: .smallSecondary)
                        }

                        VStack(spacing: 15) {
                            HStack {
                                Text(transaction.createdDisplay)
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .padding(8)
                                    .padding(.horizontal, 4)
                                    .background(Color(UIColor.systemBlue))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                
                                Spacer()

                                Text(transaction.paymentType.displayName)
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .padding(8)
                                    .padding(.horizontal, 4)
                                    .background(Color(UIColor.systemGreen))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }

                            Divider()
                            
                            HStack {
                                Text("Total")
                                    .font(.headline)
                                Spacer()
                                Text(transaction.totalDisplay)
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                }
                .cornerBorder(radius: 12)
                .padding(.horizontal, 16)

                NavigationLink(
                    destination:
                        TransactionAddView(
                            title: "Edit Transaction",
                            trxName: transaction.name,
                            paymentType: transaction.paymentType.displayName,
                            trxTotal: "\(transaction.total)",
                            trxDate: transaction.created
                        ),
                    label: {
                        HStack {
                            Spacer()
                            LabelView("Edit")
                                .foregroundColor(.white)
                                .padding(14)
                            Spacer()
                        }
                        .background(Color.orange)
                        .cornerRadius(5)
                        .padding(.horizontal, 16)
                    })
                    .buttonStyle(PlainButtonStyle())
                
//                Button(action: {
//
//                }, label: {
//                    LabelView("Delete")
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding(14)
//                        .background(Color.red)
//                        .cornerRadius(5)
//                })
//                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
        }
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(action: {
            self.presentationMode.wrappedValue.dismiss()
        }), trailing: HelpButtonView())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("Are you sure to delete this transaction?"),
                primaryButton: .destructive(Text("Yes"), action: {
                    // delete this trx
                    self.presentationMode.wrappedValue.dismiss()
                }), secondaryButton: .cancel())
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionDetailView(transaction: transactions.first!)
        }
    }
}
