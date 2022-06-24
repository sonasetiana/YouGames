//
//  RemoteDetailDataSource.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation

protocol RemoteDetailDataSource {
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void)
}

class RemoteDetailDataSourceImpl : RemoteDetailDataSource {
    
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void) {
        AppNetwork.objectRequest(
            endPoint: "/\(id)?key=\(AppConfigs.API_KEY)",
            resultType: DetailGameEntity(),
            onSuccess: { response in
                completion(.success(response))
            },
            onError: { message in
                completion(.failed(message))
            }
        )
    }
}
