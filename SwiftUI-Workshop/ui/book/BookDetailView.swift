//
//  BookDetailView.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
import SwiftUI

struct BookDetailView: View {
    
    let id: UUID
    @ObservedObject var viewModel: BookViewModel = BookViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.book != nil {
                BookDetailContent(book: self.viewModel.book!) {
                    self.viewModel.onButtonPress()
                }
            } else {
                ProgressView()
            }
            
        }
        .sheet(isPresented: self.$viewModel.showSheet) {
            CartView(showCart: self.$viewModel.showSheet)
        }
        .alert(isPresented: self.$viewModel.showAlert) {
            Alert(
                title: Text("Book added to cart"),
                message: Text("You've already to proceed to checkout and complete your order."),
                dismissButton: .default(Text("Done"))
            )
        }
        .toolbar {
            Button(action:{
                    self.viewModel.onSheetPress()
                },label: {
                    Image(systemName: "cart")
                        .foregroundColor(.gray)
            })
        }
        .onAppear {
            self.viewModel.getBook(id: self.id)
        }
    }
}


private struct BookDetailContent: View {
    let book: Book
    let onPress: () -> Void
    var body: some View {
        VStack {
            BookImage(image: self.book.image, width: 200, height: 300)

            BookAuthor(author: self.book.author, font: .body)
  
            BookTitle(title: self.book.title)
            
            BookInfo(info: self.book.info)
            
            HStack {
                ForEach(self.book.categories, id: \.self) { category in
                    ChipView(title: category) {}
                }
            }
            
            Divider().padding()
            
            
            ButtonView(title: "Buy for \(self.book.price)", onAction: onPress)
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(id: UUID())
    }
}

