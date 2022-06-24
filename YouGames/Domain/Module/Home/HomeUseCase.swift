//
//  HomeUseCase.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit

protocol HomeUseCase {
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
}

class HomeInteractor : HomeUseCase {
    private let remoteRepository : RemoteHomeRepository
    private let localRepository : LocalFavoriteRepository
    
    init(remoteRepository : RemoteHomeRepository, localRepository : LocalFavoriteRepository) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        remoteRepository.getListGames(page: page) { results in
            completion(results)
        }
    }
    
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        remoteRepository.getMoreListGames(page: page) { results in
            completion(results)
        }
    }
    
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        remoteRepository.searchGames(keyword: keyword) { results in
            completion(results)
        }
    }
}
