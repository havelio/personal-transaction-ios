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

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                VStack(spacing: 12) {
                    HStack {
                        LabelView("Transaction Details", type: .title)
                        Spacer()

                        Button(action: {
                            self.showAlert = true
                        }, label: {
                            Image(systemName: "trash")
                                .foregroundColor(.primary)
                        })
                    }
                    .padding(16)
                    .background(Color.secondaryBlue)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.gray)
                            .frame(maxWidth: .infinity, idealHeight: 180)

                        LabelView(transaction.name)
                            .lineLimit(0)
                            .padding(.bottom, 12)
                        
                        HStack(alignment: .top, spacing: 5) {
                            LabelView("Notes:", type: .smallSecondary)
                            LabelView(transaction.notes, type: .small)
                        }
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
                    .padding(.bottom, 16)
                }
                .cornerBorder(radius: 5)
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
                                .padding(18)
                            Spacer()
                        }
                        .background(Color.orange)
                        .cornerRadius(5)
                        .padding(.horizontal, 16)
                    })
                    .buttonStyle(PlainButtonStyle())
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
