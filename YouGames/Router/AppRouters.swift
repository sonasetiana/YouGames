//
//  AppRouters.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation
import SwiftUI

class AppRouters {
    static func toHomeView() -> some View {
        let interactor = HomeInteractor()
        let presenter = HomePresenter() 
        interactor.presenter = presenter
        presenter.interactor = interactor
        return HomeView(presenter: presenter)
    }
    
    static func toDetailView(id: Int) -> some View {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        interactor.presenter = presenter
        presenter.interactor = interactor
        return DetailView(id: id, presenter: presenter)
    }
    
    static func toProfileView() -> some View {
        return ProfileView()
    }
}
