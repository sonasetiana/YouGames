//
//  HomePresenter.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation

protocol HomePresenterContract {
    var interactor: HomeInteractorContract? { get set }
    func getListGames()
    func getMoreGames()
    func serachGames()
    func onLoading(isLoading: Bool)
    func onLoadingMore(isLoading: Bool)
    func onSuccess(results: [GameEntity])
    func onMoreSuccess(results: [GameEntity])
    func onError(message: String)
}

class HomePresenter: ObservableObject, HomePresenterContract {
    var interactor: HomeInteractorContract?
    @Published var loading: Bool = false
    @Published var loadingMore: Bool = false
    @Published var error: String = ""
    @Published var items: [GameEntity] = []
    @Published var nextPage: Int = 1
    private var workItemRef : DispatchWorkItem?
    @Published var keyword = "" {
            didSet {
                workItemRef?.cancel()
                let workItem = DispatchWorkItem
                {
                    if !self.keyword.isEmpty {
                        self.serachGames()
                    }else {
                        self.getListGames()
                    }
                }
                workItemRef = workItem
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: workItem)
            }
        }
    func getListGames() {
        self.nextPage = 1
        interactor?.getListGames(page: nextPage)
    }
    
    func getMoreGames() {
        interactor?.getMoreListGames(page: nextPage)
    }
    
    func serachGames() {
        interactor?.searchGames(keyword: keyword)
    }
    
    func onLoading(isLoading: Bool) {
        DispatchQueue.main.async {
            self.loading = isLoading
        }
    }

    func onLoadingMore(isLoading: Bool) {
        DispatchQueue.main.async {
            self.loadingMore = isLoading
        }
    }
    
    func onSuccess(results: [GameEntity]) {
        DispatchQueue.main.async {
            self.items = []//results
            if !self.items.isEmpty {
                self.nextPage += 1
            }
        }
    }
    
    func onMoreSuccess(results: [GameEntity]) {
        DispatchQueue.main.async {
            self.items.append(contentsOf: results)
            if !results.isEmpty {
                self.nextPage += 1
            }
        }
    }
    
    func onError(message: String) {
        DispatchQueue.main.async {
            self.error = message
        }
    }
    
}
