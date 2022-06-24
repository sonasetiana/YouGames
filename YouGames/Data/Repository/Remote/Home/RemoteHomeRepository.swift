//
//  RemoteHomeRepository.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit

protocol RemoteHomeRepository {
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
}

class RemoteHomeRepositoryImpl : RemoteHomeRepository {
    private let dataSource : RemoteHomeDataSource
    init(dataSource : RemoteHomeDataSource) {
        self.dataSource = dataSource
    }
    
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        dataSource.getListGames(page: page) { results in
            completion(results)
        }
    }
    
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        dataSource.getListGames(page: page) { results in
            completion(results)
        }
    }
    
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        dataSource.searchGames(keyword: keyword) { results in
            completion(results)
        }
    }
}
