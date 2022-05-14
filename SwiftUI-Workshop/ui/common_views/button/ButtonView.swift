//
//  ButtonView.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    
    let title: String
    var minWidth: CGFloat = 250.0
    var cornerRadius: CGFloat = 30.0
    var textColor: Color = .white
    var buttonColor: Color = .black
    let onAction: () -> Void
    
    var body: some View {
        Button(action: self.onAction, label: {
            VStack {
                Text(self.title)
                    .fontWeight(.bold)
                    .foregroundColor(self.textColor)
                    .padding()
                    .frame(minWidth: self.minWidth)
            }.background(self.buttonColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                )
        })
    }
}
