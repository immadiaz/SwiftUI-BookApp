//
//  BookListView.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
import SwiftUI

struct BookListView: View {
    
    
    @ObservedObject var viewModel: BooksViewModel = BooksViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.bookList) { book in
                    NavigationLink(destination: BookDetailView(id: book.id)) {
                        BookItemCard(book: book)
                    }
                }
                
            }.navigationBarTitle(Text("Book List"))
        }
        }
}



struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
