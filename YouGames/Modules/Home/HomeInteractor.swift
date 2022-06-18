//
//  HomeInteractor.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation

protocol HomeInteractorContract {
    var presenter : HomePresenterContract? { get set }
    func getListGames(page: Int)
    func getMoreListGames(page: Int)
    func searchGames(keyword: String)
}

class HomeInteractor : HomeInteractorContract {
    
    var presenter: HomePresenterContract?
    
    func getListGames(page: Int) {
        presenter?.onLoading(isLoading: true)
        AppNetwork.listRequest(
            endPoint: "?page_size=\(page)&key=\(AppConfigs.API_KEY)",
            resultType: GameEntity(),
            onSuccess: { response in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onSuccess(results: response.results ?? [])
            },
            onError: { message in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onError(message: message)
            }
        )
    }
    
    func getMoreListGames(page: Int) {
        presenter?.onLoadingMore(isLoading: true)
        AppNetwork.listRequest(
            endPoint: "?page_size=\(page)&key=\(AppConfigs.API_KEY)",
            resultType: GameEntity(),
            onSuccess: { response in
                self.presenter?.onLoadingMore(isLoading: false)
                self.presenter?.onMoreSuccess(results: response.results ?? [])
            },
            onError: {_ in
                self.presenter?.onLoadingMore(isLoading: false)
            }
        )
    }
    
    func searchGames(keyword: String) {
        presenter?.onLoading(isLoading: true)
        AppNetwork.listRequest(
            endPoint: "?search=\(keyword)&key=\(AppConfigs.API_KEY)",
            resultType: GameEntity(),
            onSuccess: { response in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onSuccess(results: response.results ?? [])
            },
            onError: { message in
                self.presenter?.onLoading(isLoading: false)
                self.presenter?.onError(message: message)
            }
        )
    }
}
