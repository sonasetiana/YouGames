//
//  DetailInteractor.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation

protocol DetailInteractorContract {
    var presenter: DetailPresenterContract? { get set }
    func getDetail(id: Int)
}

class DetailInteractor : DetailInteractorContract {
    var presenter: DetailPresenterContract?
    
    func getDetail(id: Int) {
        presenter?.onLoading(isLoading: true)
        AppNetwork.objectRequest(
            endPoint: "/\(id)?key=\(AppConfigs.API_KEY)",
            resultType: DetailGameEntity(),
            onSuccess: { response in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onSuccess(result: response)
            },
            onError: { message in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onError(message: message)
            }
        )
    }
}
