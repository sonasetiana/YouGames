//
//  DataModule.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation

final class DataModule : NSObject {
    
    func provideFavoriteDataSource() -> LocalFavoriteDataSource {
        let coreDataManager = CoreDataManager()
        return LocalFavoriteDataSourceImpl(coreDataManager: coreDataManager)
    }
    
    func provideFavoriteRepository() -> LocalFavoriteRepository {
        return LocalFavoriteRepositoryImpl(dataSource: provideFavoriteDataSource())
    }
    
    func provideDetailDataSource() -> RemoteDetailDataSource {
        return RemoteDetailDataSourceImpl()
    }
    
    func provideDetailRepository() -> RemoteDetailRepository {
        let dataSource = provideDetailDataSource()
        return RemoteDetailRepositoryImpl(dataSource: dataSource)
    }
    
    func provideHomeDataSource() -> RemoteHomeDataSource {
        return RemoteHomeDataSourceImpl()
    }
    
    func provideHomeRepository() -> RemoteHomeRepository {
        let dataSource = provideHomeDataSource()
        return RemoteHomeRepositoryImpl(dataSource: dataSource)
    }
    
}
