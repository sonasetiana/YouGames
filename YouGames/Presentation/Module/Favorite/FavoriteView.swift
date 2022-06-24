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
        VStack{
            listView
        }
        .background(AppColors.BackgroudColor)
        .onAppear(perform: {
            self.viewModel.fetchFavorite()
        })
    }
}

extension FavoriteView {
    var listView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(0..<self.viewModel.favorites.count, id: \.self) { i in
                    let item = self.viewModel.favorites[i]
                    ItemGameView(
                        id: item.id,
                        imageUrl: item.image,
                        releaseAt: item.released,
                        title: item.name,
                        tags: item.genres,
                        rating: String(item.rating)
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
