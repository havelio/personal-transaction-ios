//
//  TransactionAddView.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import SwiftUI

struct TransactionAddView: View {

    @State var trxName = ""
    @State var paymentType = Transaction.PaymentType.cash.displayName
    @State var trxTotal = ""
    @State var trxDate = Date()

    @State private var showAlert = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("", text: $trxName)
            }

            Section(header: Text("Total")) {
                TextField("", text: $trxTotal)
                    .keyboardType(.decimalPad)
            }

            Section(header: Text("Payment & Date")) {
                Picker(selection: $paymentType, label: Text("Payment Type")
                        .foregroundColor(paymentType.isEmpty ? .secondary : .primary)
                ) {
                    ForEach(Transaction.PaymentType.allCases) { value in
                        Text(value.displayName)
                    }
                }
                
                DatePicker("Transaction Date", selection: $trxDate, displayedComponents: .date)
            }
        }
        .navigationBarTitle("Add Transaction", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(action: {
            presentationMode.wrappedValue.dismiss()
        }), trailing: Button(action: {
            if trxName.isEmpty || trxTotal.isEmpty {
                showAlert = true
            } else {
                // update or create
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Save")
                .foregroundColor(.white)
        }))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Please Complete the form"),
                  message: Text("Transaction Name or Total cannot be empty"))
        }
    }
}

struct TransactionAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionAddView()
        }
    }
}
