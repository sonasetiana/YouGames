//
//  DetailPresenter.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation

protocol DetailPresenterContract {
    var interactor: DetailInteractorContract? { get set }
    func onLoading(isLoading: Bool)
    func onSuccess(result: DetailGameEntity?)
    func onError(message: String)
    func getDetail(id: Int)
}

class DetailPresenter : ObservableObject, DetailPresenterContract {
    var interactor: DetailInteractorContract?
    @Published var loading: Bool = false
    @Published var error: String = ""
    @Published var item: DetailGameEntity?
    func getDetail(id: Int) {
        interactor?.getDetail(id: id)
    }
    func onLoading(isLoading: Bool) {
        DispatchQueue.main.async {
            self.loading = isLoading
        }
    }
    
    func onSuccess(result: DetailGameEntity?) {
        DispatchQueue.main.async {
            self.item = result
        }
    }
    
    func onError(message: String) {
        DispatchQueue.main.async {
            self.error = message
        }
    }
}
