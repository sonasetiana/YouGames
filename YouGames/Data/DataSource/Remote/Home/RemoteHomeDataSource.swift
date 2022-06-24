//
//  RemoteHomeDataSource.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation

protocol RemoteHomeDataSource {
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void)
}

class RemoteHomeDataSourceImpl : RemoteHomeDataSource {
    func getListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        AppNetwork.listRequest(
            endPoint: "?page_size=10&key=\(AppConfigs.API_KEY)&page=\(page)",
            resultType: GameEntity(),
            onSuccess: { response in
                completion(.success(response.results ?? []))
            },
            onError: { message in
                completion(.failed(message))
            }
        )
    }
    
    func getMoreListGames(page: Int, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        AppNetwork.listRequest(
            endPoint: "?page_size=10&key=\(AppConfigs.API_KEY)&page=\(page)",
            resultType: GameEntity(),
            onSuccess: { response in
                completion(.success(response.results ?? []))
            },
            onError: { message in
                completion(.failed(message))
            }
        )
    }
    
    func searchGames(keyword: String, completion: @escaping (BaseResult<[GameEntity], String>) -> Void) {
        AppNetwork.listRequest(
            endPoint: "?search=\(keyword)&key=\(AppConfigs.API_KEY)",
            resultType: GameEntity(),
            onSuccess: { response in
                completion(.success(response.results ?? []))
            },
            onError: { message in
                completion(.failed(message))
            }
        )
    }
}
