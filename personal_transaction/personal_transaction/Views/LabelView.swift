//
//  LabelView.swift
//  personal_transaction
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI

struct LabelView: View {
    
    enum LabelType {
        case small, smallSecondary, normal, normalSecondary, large, title, veryLarge
    }

    var text: String
    var type: LabelType
    
    init(_ text: String, type: LabelType = .normal) {
        self.text = text
        self.type = type
    }

    var body: some View {
        switch type {
        case .small:
            return Text(text)
                .font(.system(size: 12))
        case .smallSecondary:
            return Text(text)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        case .normal:
            return Text(text)
                .font(.system(size: 14))
        case .normalSecondary:
            return Text(text)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
        case .large:
            return Text(text)
                .font(.system(size: 16))
                .foregroundColor(.secondary)

        case .title:
            return Text(text)
                .font(.system(size: 16))
                .fontWeight(.medium)

        case .veryLarge:
            return Text(text)
                .font(.system(size: 18))
        }
    }
}
