//
//  AppModule.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import SwiftUI

final class AppModule : NSObject {
    
    func provideHomeView() -> some View {
        let useCase = DomainModule.init().provideHomeUseCase()
        let viewModule = HomeViewModel(useCase: useCase)
        return HomeView(viewModel: viewModule)
    }
    
    func proviewDetailView(id: Int) -> some View {
        let useCase = DomainModule.init().provideDetailUseCase()
        let viewModel = DetailViewModel(useCase: useCase)
        return DetailView(id: id, viewModel: viewModel)
    }
    
    func provideProfileView() -> some View {
        return ProfileView()
    }
    
    func provideFavoriteView() -> some View {
        let useCase = DomainModule.init().provideFavoriteUseCase()
        let viewModule = FavoriteViewModel(useCase: useCase)
        return FavoriteView(viewModel: viewModule)
    }
}
