//
//  FavoriteInteractor.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation

protocol FavoriteUseCase {
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void)
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
}

class FavoriteInteractor : FavoriteUseCase {
    
    private let repository : LocalFavoriteRepository
    
    init(repository : LocalFavoriteRepository) {
        self.repository = repository
    }
    
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        repository.deleteFavorite(data: data) { result in
            completion(result)
        }
    }
    
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void) {
        repository.getListFavorite() { result in
            completion(result)
        }
    }
}
