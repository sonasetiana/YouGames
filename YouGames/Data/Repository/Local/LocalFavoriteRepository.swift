//
//  LocalFavoriteRepository.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit

protocol LocalFavoriteRepository {
    func saveFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func updateFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void)
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void)
}

class LocalFavoriteRepositoryImpl : LocalFavoriteRepository {
    
    private let dataSource : LocalFavoriteDataSource
    
    init(dataSource : LocalFavoriteDataSource) {
        self.dataSource = dataSource
    }
    
    func saveFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        dataSource.saveFavorite(data: data) { result in
            completion(result)
        }
    }
    
    func updateFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        dataSource.updateFavorite(data: data) { result in
            completion(result)
        }
    }
    
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        dataSource.deleteFavorite(data: data) { result in
            completion(result)
        }
    }
    
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void) {
        dataSource.getListFavorite { result in
            completion(result)
        }
    }
    
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void) {
        dataSource.findFavorite(id: id) { result in
            completion(result)
        }
    }
    
}
