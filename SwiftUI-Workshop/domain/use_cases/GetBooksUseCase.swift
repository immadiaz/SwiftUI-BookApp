//
//  GetBooksUseCase.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation


class GetBooksUseCase {
    
    private let repository: BookRepository
    
    init(repository: BookRepository = BookRepositoryImp.shared) {
        self.repository = repository
    }
    
    func invoke() -> [Book] {
        return self.repository.getBooks()
    }
}
