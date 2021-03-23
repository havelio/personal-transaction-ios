//
//  ContentView.swift
//  personal_transaction
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0

    init() {
        let navbarAppearance = UINavigationBar.appearance()

        navbarAppearance.barTintColor = .systemBlue
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        TabView(selection: $selection) {
            TransactionView()
                .tabItem {
                    let systemImage = selection == 0 ? "cart.fill" : "cart"
                    Label("Transaction", systemImage: systemImage)
                }
                .tag(0)
            AccountView()
                .tabItem {
                    let systemImage = selection == 1 ? "person.fill" : "person"
                    Label("Account", systemImage: systemImage)
                }
                .tag(1)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
