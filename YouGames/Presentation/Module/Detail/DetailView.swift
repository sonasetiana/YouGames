//
//  DetailView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct DetailView: View {
    var id: Int
    @ObservedObject var viewModel: DetailViewModel
    var body: some View {
        HStack {
            Spacer()
            VStack {
                if viewModel.loading {
                    LoadingView()
                }else if !viewModel.error.isEmpty {
                    ErrorView(
                        message: viewModel.error,
                        completion: {
                            viewModel.getDetailGame(id: id)
                        }
                    )
                }else {
                    contentView
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(AppColors.BackgroudColor)
        .onAppear(perform: {
            viewModel.getDetailGame(id: id)
        })
    }
}

extension DetailView {
    var contentView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                imageView
                TitleBox(
                    imageUrl: viewModel.item?.background_image,
                    releaseAt: viewModel.item?.released,
                    title: viewModel.item?.name,
                    tags: arraysToString(items: viewModel.item?.genres ?? []),
                    rating: String(viewModel.item?.rating ?? 0.0),
                    isFavorite: viewModel.isFavorite,
                    favoriteCallback: {
                        self.viewModel.saveToFavorite(item: viewModel.item!)
                    }
                )
                DescriptionBox(description: viewModel.item?.description_raw)
                PlatformBox(
                    platforms: arrayToPlatforms(items: viewModel.item?.parent_platforms ?? [])
                )
                DescriptionBox(
                    title: "Tags",
                    description: arraysToString(items: viewModel.item?.tags ?? [])
                )
                StoresBox(
                    items: arrayToStores(items: viewModel.item?.stores ?? [])
                )
                DescriptionBox(
                    title: "Developers",
                    description: arraysToString(items: viewModel.item?.developers ?? [])
                )
                DescriptionBox(
                    title: "Publishers",
                    description: arraysToString(items: viewModel.item?.publishers ?? [])
                )
                DescriptionBox(
                    title: "Website",
                    description: viewModel.item?.website ?? ""
                )
            }
        }
    }
    var imageView : some View {
        ZStack {
            NetImageView(
                url: viewModel.item?.background_image ?? "",
                width: .infinity,
                height: .infinity
            )
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(AppColors.CoverColor)
                .frame(height: .infinity)
        }
        .frame(height: 240)
        .padding(.bottom)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppModule.init().proviewDetailView(id: 3498)
    }
}
