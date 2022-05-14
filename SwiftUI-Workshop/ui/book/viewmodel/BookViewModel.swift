//
//  BookViewModel.swift
//  SwiftUI-Workshop
//
//  Created by Immanuel Salazar on 13/05/22.
//

import Foundation


class BookViewModel: ObservableObject {
    
    
    @Published var showSheet: Bool = false
    @Published var showAlert: Bool = false
    

    @Published var book: Book? = nil
    
    
    func getBook(id: UUID) {
        self.book = GetBookUseCase(id: id).invoke()
    }
    
    
    func onSheetPress() {
        self.showSheet.toggle()
    }
    
    func onButtonPress() {
        self.showAlert.toggle()
    }
    
    func getCategoriesFromBook() -> [String]  {
        return self.book?.categories ?? []
    }
    
}
