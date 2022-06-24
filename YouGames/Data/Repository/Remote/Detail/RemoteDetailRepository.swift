//
//  RemoteDetailRepository.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import UIKit

protocol RemoteDetailRepository {
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void)
}

class RemoteDetailRepositoryImpl : RemoteDetailRepository {
    private let dataSource : RemoteDetailDataSource
    init(dataSource : RemoteDetailDataSource) {
        self.dataSource = dataSource
    }
    
    func getDetailGame(id: Int, completion: @escaping (BaseResult<DetailGameEntity, String>) -> Void) {
        dataSource.getDetailGame(id: id, completion: { result in
            completion(result)
        })
    }
}
