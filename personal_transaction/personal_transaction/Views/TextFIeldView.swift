//
//  TextFIeldView.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import SwiftUI

struct TextFIeldView: View {
    
    @Binding var text: String
    @State private var onEditing = false
    var placeholder: String = ""
    var onEditingChanged: ((_ onEdit: Bool) -> Void)? = nil
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { onEdit in
            onEditing.toggle()
            onEditingChanged?(onEdit)
        }, onCommit: {})
        .font(.body)
        .modifier(ClearButton(text: $text, visible: $onEditing))

        Divider()
            .background(onEditing ? Color.blue : Color.gray)
    }
}
