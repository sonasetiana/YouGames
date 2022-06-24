//
//  DetailViewModel.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit
import SwiftUI

class DetailViewModel : ObservableObject {
    private let useCase : DetailUseCase
    init(useCase : DetailUseCase) {
        self.useCase = useCase
    }
    
    @Published var loading : Bool = false
    @Published var error : String = ""
    @Published var item : DetailGameEntity?
    @Published var isFavorite : Bool = false
    
    func saveToFavorite(item: DetailGameEntity) {
        useCase.saveToFavorite(item: item) { result in
            switch(result) {
                case .success(let message) :
                    toast(message: message)
                    self.isDetailFavorite(id: item.id)
                case .failed(let message) :
                    toast(message: message)
            }
        }
    }
    
    func getDetailGame(id: Int) {
        loading = true
        useCase.getDetailGame(id: id, completion: { result in
            switch(result) {
            case .success(let data) :
                self.loading = false
                self.item = data
                self.isDetailFavorite(id: data.id)
            case .failed(let message) :
                self.loading = false
                self.error = message
            }
        })
    }
    
    func isDetailFavorite(id: Int?)  {
        if id == nil { return }
        useCase.findFavorite(id: id!) { result in
            switch(result) {
            case .success(_) :
                self.isFavorite = true
            case .failed(_) :
                self.isFavorite = false
            }
        }
    }
}
