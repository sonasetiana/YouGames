//
//  DomainModule.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation

final class DomainModule : NSObject {
    
    func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = DataModule.init().provideFavoriteRepository()
        return FavoriteInteractor(repository: repository)
    }
    
    func provideDetailUseCase() -> DetailUseCase {
        let module = DataModule.init()
        let local = module.provideFavoriteRepository()
        let remote = module.provideDetailRepository()
        return DetailInteractor(remoteRepository: remote, localRepository: local)
    }
    
    func provideHomeUseCase() -> HomeUseCase {
        let module = DataModule.init()
        let local = module.provideFavoriteRepository()
        let remote = module.provideHomeRepository()
        return HomeInteractor(remoteRepository: remote, localRepository: local)
    }
}
