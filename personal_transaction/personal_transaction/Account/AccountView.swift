//
//  Account.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 15) {
                    VStack(spacing: 5) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                        
                        LabelView("Havelio Henar", type: .veryLarge)
                        LabelView("Version: 1.0", type: .normalSecondary)
                        Divider()
                            .padding(.top, 16)
                    }
                    
                    VStack(spacing: 15) {
                        HStack(spacing: 7) {
                            Image(systemName: "person")
                            LabelView("Edit Profile")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        Divider()

                        HStack(spacing: 7) {
                            Image(systemName: "phone")
                            LabelView("Contact Me")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        Divider()
                    
                        HStack(spacing: 7) {
                            Image(systemName: "star")
                            LabelView("Rate This App")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        Divider()
                    
                        HStack(spacing: 7) {
                            Image(systemName: "trash")
                            LabelView("Clear Data")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(20)
            }
            .navigationBarTitle("Account", displayMode: .inline)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
