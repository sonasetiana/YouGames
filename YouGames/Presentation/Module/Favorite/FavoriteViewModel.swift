//
//  FavoriteViewModel.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation


class FavoriteViewModel : ObservableObject {
    private let useCase : FavoriteUseCase
    
    init(useCase : FavoriteUseCase) {
        self.useCase = useCase
    }
    
    @Published var loading : Bool = false
    @Published var error : String = ""
    @Published var favorites : [FavoriteData]  = []
    
    func fetchFavorite() {
        loading = true
        useCase.getListFavorite() { result in
            switch(result) {
                case .success(let items) :
                    self.loading = false
                    self.favorites = items
                case .failed(let message) :
                    self.loading = false
                    self.error = message
            }
        }
    }
    
    func deleteFavorite(favorite: FavoriteData) {
        useCase.deleteFavorite(data: favorite) { result in
            switch(result) {
                case .success(let message) :
                    toast(message: message)
                case .failed(let message) :
                    toast(message: message)
            }
        }
    }
    
}
