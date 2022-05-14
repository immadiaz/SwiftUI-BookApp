//
//  BookRepositoryImp.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation
protocol BookRepository {
    func getBooks() -> [Book]
    func getBook(id: UUID) -> Book
}

struct BookRepositoryImp: BookRepository {
    
    static var shared: BookRepositoryImp = {
            let instance = BookRepositoryImp()
            return instance
        }()
    
    func getBooks() -> [Book] {
        return generateData()
    }
    
    func getBook(id: UUID) -> Book {
        return generateData().first(where: { $0.id == id }) ?? generateData()[0]
    }
    
    private func generateData() -> [Book] {
        let bookList:[Book] = [
            Book(title: "The fellowship of the Ring", author: "J.R.R tolkien", price: "18.99", categories: ["Fantasy","Action","Novel"], image: "Book", info: "The Fellowship of the Ring is the first of three volumes of the epic novel The Lord of the Rings by the English author J. R. R. Tolkien. It is followed by The Two Towers and The Return of the King."),
            Book(title: "The fellowship of the Ring", author: "J.R.R tolkien", price: "18.99", categories: ["Fantasy","Action","Novel"], image: "Book", info: "The Fellowship of the Ring is the first of three volumes of the epic novel The Lord of the Rings by the English author J. R. R. Tolkien. It is followed by The Two Towers and The Return of the King."),
            Book(title: "The fellowship of the Ring", author: "J.R.R tolkien", price: "18.99", categories: ["Fantasy","Action","Novel"], image: "Book", info: "The Fellowship of the Ring is the first of three volumes of the epic novel The Lord of the Rings by the English author J. R. R. Tolkien. It is followed by The Two Towers and The Return of the King."),
            Book(title: "The fellowship of the Ring", author: "J.R.R tolkien", price: "18.99", categories: ["Fantasy","Action","Novel"], image: "Book", info: "The Fellowship of the Ring is the first of three volumes of the epic novel The Lord of the Rings by the English author J. R. R. Tolkien. It is followed by The Two Towers and The Return of the King.")
        ]
        return bookList
    }
}
