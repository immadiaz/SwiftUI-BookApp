//
//  BookItemCard.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
import SwiftUI

struct BookItemCard: View {
    let book: Book
    var showCartView: Bool = false
    var showAuthorView: Bool = true
    var quantity: Int = 0
    
    var body: some View {
        VStack {
            HStack(spacing:20) {
                
                BookImage(image: self.book.image)
                
                VStack(alignment: .leading) {
                    BookTitle(title: self.book.title)
                    if self.showAuthorView {
                        BookAuthor(author: self.book.author)
                    }
                    BookPrice(price: self.book.price)
                }
                
                if self.showCartView {
                    CountView(quantity: self.quantity)
                }

            }
        }.padding(.vertical, 8)
    }
}

struct BookImage: View {
    
    let image: String
    var width: CGFloat = 100
    var height: CGFloat = 150
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        Image(self.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
            .shadow(color: .gray, radius: self.cornerRadius / 2 , x: 5, y: 5)
            .frame(width: self.width, height: self.height)
    }
}

struct BookTitle: View {
    let title: String
    var body: some View {
        Text(self.title)
            .font(.title3)
            .fontWeight(.semibold)
    }
}

struct BookAuthor: View {
    let author: String
    var font: Font = .subheadline
    var body: some View {
        Text("by \(self.author)")
            .font(self.font)
            .foregroundColor(.gray)
    }
}

struct BookPrice: View {
    let price: String
    var body: some View {
        Text("$\(self.price)")
            .font(.title2)
            .padding(.vertical, 15)
    }
}

struct BookInfo: View {
    let info: String
    var body: some View {
        Text(self.info)
            .font(.body)
            .foregroundColor(.gray)
            .lineLimit(4)
            .padding()
    }
}

struct CountView: View {
    var  quantity: Int = 0
    var body: some View {
        VStack {
            Text("x \(self.quantity)")
                .fontWeight(.semibold)
                .padding(10)
               
        }.overlay(
            RoundedRectangle(cornerRadius: 20).stroke(.gray)
        )
    }
}

struct Previews_BookItemCard_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}
