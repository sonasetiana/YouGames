//
//  FavoriteView.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Favorite")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(
                        top: 72,
                        leading: AppSpacing.medium,
                        bottom: AppSpacing.medium,
                        trailing: AppSpacing.medium
                    ))
                Spacer()
            }
            
            if viewModel.loading {
                LoadingView()
            } else if !viewModel.error.isEmpty {
                ErrorView(message: viewModel.error) {
                    self.viewModel.fetchFavorite()
                }
            } else {
                if viewModel.favorites.isEmpty {
                    EmptyView(message: "You don't have favorite")
                } else {
                    listView
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(AppColors.BackgroudColor)
        .onAppear(perform: {
            self.viewModel.fetchFavorite()
        })
        .edgesIgnoringSafeArea(.all)
    }
}

extension FavoriteView {
    var listView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(0..<self.viewModel.favorites.count, id: \.self) { index in
                    let item = self.viewModel.favorites[index]
                    
                    ItemGameView(
                        id: item.id,
                        imageUrl: item.image,
                        releaseAt: item.released,
                        title: item.name,
                        tags: item.genres,
                        rating: String(item.rating),
                        isFavorite: true,
                        favoriteCallback: {
                            self.viewModel.deleteFavorite(index: index, favorite: item)
                        }
                    )
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        AppModule.init().provideFavoriteView()
    }
}
