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

struct ActionButtonView: View {

    var text: String
    var action: () -> Void?
    var maxWidth: CGFloat = .infinity

    var body: some View {
        Button(action: { action() }, label: {
            LabelView(text)
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: maxWidth)
                .background(Color.orange)
        })
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    @Binding var visible: Bool

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content

            Spacer()
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                })
                .opacity(visible ? 1 : 0)
                .padding(.trailing, 8)
            }
        }
    }
}
