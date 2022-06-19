//
//  DetailView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct DetailView: View {
    var id: Int
    @ObservedObject var presenter: DetailPresenter
    var body: some View {
        HStack {
            Spacer()
            VStack {
                if presenter.loading {
                    LoadingView()
                }else if !presenter.error.isEmpty {
                    ErrorView(
                        message: presenter.error,
                        completion: {
                            presenter.getDetail(id: id)
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
            presenter.getDetail(id: id)
        })
    }
}

extension DetailView {
    var contentView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                imageView
                TitleBox(
                    imageUrl: presenter.item?.background_image,
                    releaseAt: presenter.item?.released,
                    title: presenter.item?.name,
                    tags: arraysToString(items: presenter.item?.genres ?? []),
                    rating: String(presenter.item?.rating ?? 0.0))
                DescriptionBox(description: presenter.item?.description_raw)
                PlatformBox(
                    platforms: arrayToPlatforms(items: presenter.item?.parent_platforms ?? [])
                )
                DescriptionBox(
                    title: "Tags",
                    description: arraysToString(items: presenter.item?.tags ?? [])
                )
                StoresBox(
                    items: arrayToStores(items: presenter.item?.stores ?? [])
                )
                DescriptionBox(
                    title: "Developers",
                    description: arraysToString(items: presenter.item?.developers ?? [])
                )
                DescriptionBox(
                    title: "Publishers",
                    description: arraysToString(items: presenter.item?.publishers ?? [])
                )
                DescriptionBox(
                    title: "Website",
                    description: presenter.item?.website ?? ""
                )
            }
        }
    }
    var imageView : some View {
        ZStack {
            NetImageView(
                url: presenter.item?.background_image ?? "",
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
        AppRouters.toDetailView(id: 3498)
    }
}
