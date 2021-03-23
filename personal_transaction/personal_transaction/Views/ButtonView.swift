//
//  ButtonView.swift
//  personal_transaction
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct HelpButtonView: View {
    
    var action: () -> Void?
    
    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.white)
        })
    }
}

struct BackButtonView: View {
    
    var action: () -> Void?
    
    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
        })
    }
}
