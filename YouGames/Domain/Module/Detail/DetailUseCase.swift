//
//  DetailUseCase.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit

protocol DetailUseCase {
    func saveToFavorite(item: DetailGameEntity, completion: @escaping (BaseResult<String, String>) -> Void)
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void)
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void)
}

class DetailInteractor : DetailUseCase {
    private let remoteRepository : RemoteDetailRepository
    private let localRepository : LocalFavoriteRepository
    
    init(remoteRepository : RemoteDetailRepository, localRepository : LocalFavoriteRepository) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func saveToFavorite(item: DetailGameEntity, completion: @escaping (BaseResult<String, String>) -> Void) {
        let data = FavoriteData(
            id: item.id ?? 0,
            slug: item.slug ?? "",
            name: item.name ?? "",
            released: item.released ?? "",
            image: item.background_image ?? "",
            rating: item.rating ?? 0.0,
            genres: arraysToString(items: item.genres ?? [])
        )
        localRepository.saveFavorite(data: data) { result in
            completion(result)
        }
    }
    
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void) {
        remoteRepository.getDetailGame(id: id, completion: { result in
            completion(result)
        })
    }
    
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void) {
        localRepository.findFavorite(id: id) { result in
            completion(result)
        }
    }
}
