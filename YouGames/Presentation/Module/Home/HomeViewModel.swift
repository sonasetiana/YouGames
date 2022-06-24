//
//  HomeViewModel.swift
//  YouGames
//
//  Created by sona setiana on 25/06/22.
//

import Foundation
import UIKit

class HomeViewModel : ObservableObject {
    private let useCase : HomeUseCase
    init(useCase : HomeUseCase) {
        self.useCase = useCase
    }
    
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
        nextPage = 1
        loading = true
        useCase.getListGames(page: nextPage) { result in
            switch(result){
            case .success(let items) :
                self.loading = false
                self.items = items
            case .failed(let message) :
                self.loading = false
                self.error = message
            }
        }
    }
    
    func getMoreGames() {
        loadingMore = true
        useCase.getMoreListGames(page: nextPage) { result in
            switch(result){
            case .success(let items) :
                self.loadingMore = false
                self.items.append(contentsOf: items)
                if !items.isEmpty {
                    self.nextPage += 1
                }
            case .failed(_) :
                self.loadingMore = false
            }
        }
    }
    
    func serachGames() {
        nextPage = 1
        loading = true
        useCase.searchGames(keyword: keyword) { result in
            switch(result){
            case .success(let items) :
                self.loading = false
                self.items = items
            case .failed(let message) :
                self.loading = false
                self.error = message
            }
        }
    }
}
