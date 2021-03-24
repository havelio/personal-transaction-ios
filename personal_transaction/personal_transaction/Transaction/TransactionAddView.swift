//
//  TransactionAddView.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import SwiftUI

struct TransactionAddView: View {
    
    @State private var trxName = ""
    @State private var paymentType = Transaction.PaymentType.cash.displayName
    @State private var trxTotal = ""

    @State var trxDate = Date()
    @State var paymentTypeSelected = false

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
        }), trailing: Button(action: {            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .foregroundColor(.white)
        }))
    }
}

struct TransactionAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionAddView()
        }
    }
}
