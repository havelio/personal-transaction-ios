//
//  ViewExtentions.swift
//  personal_transaction
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI


extension View {
    func cornerBorder(radius: CGFloat = 3, lineWidth: CGFloat = 1,
                      color: Color = Color.gray.opacity(0.4)) -> some View {
        return overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: lineWidth)
        )
    }
}
