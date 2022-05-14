//
//  ChipView.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
import SwiftUI


struct ChipView: View {
    
    let title: String
    let strokeColor: Color = .gray
    let padding: CGFloat = 10
    let cornerRadius: CGFloat = 20
    let onAction: () -> Void
    
    var body: some View {
        Button(action: self.onAction, label: {
            VStack{
                Text(self.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(self.padding)
            }
            .overlay(
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(self.strokeColor)
            )
        }
        )
    }
}
