//
//  ChildDetailView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct TitleBox: View {
    var imageUrl: String?
    var releaseAt: String?
    var title: String?
    var tags: String?
    var rating: String?
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                dateView
                titleView
                tagsView
                ratingView
            }.padding(.horizontal, AppSpacing.normal)
            Spacer()
        }
        .padding(.all, AppSpacing.regular)
        .background(AppColors.MainColor)
        .cornerRadius(6)
        .padding(.horizontal, AppSpacing.normal)
        .padding(.bottom, AppSpacing.small)
    }
}

extension TitleBox {
    var dateView : some View {
        Text(releaseAt ?? "")
            .font(.system(size: 12, weight: .light))
            .foregroundColor(.white)
    }
    var titleView : some View {
        Text(title ?? "")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, AppSpacing.tiny)
    }
    var tagsView : some View {
        Text(tags ?? "")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white)
            .lineLimit(4)
    }
    var ratingView : some View {
        HStack {
            Spacer()
            Image(AppIcons.imgrRating)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating ?? "")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct DescriptionBox: View {
    var title: String?
    var description: String?
    var body: some View {
        VStack {
            HStack {
                VStack(alignment:.leading) {
                    titleView
                    descriptionView
                }
                Spacer()
            }
        }
        .padding(.all, AppSpacing.regular)
        .background(AppColors.MainColor)
        .cornerRadius(6)
        .padding(.horizontal, AppSpacing.normal)
        .padding(.bottom, AppSpacing.small)
    }
}

extension DescriptionBox {
    var titleView : some View {
        Text(title ?? "Description")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.bottom, AppSpacing.tiny)
    }
    var descriptionView : some View {
        Text(description ?? "")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
}

struct PlatformBox: View {
    var platforms: [String]?
    var body: some View {
        VStack {
            HStack {
                VStack(alignment:.leading) {
                    titleView
                    platformIcon
                }
                Spacer()
            }
        }
        .padding(.all, AppSpacing.regular)
        .background(AppColors.MainColor)
        .cornerRadius(6)
        .padding(.horizontal, AppSpacing.normal)
        .padding(.bottom, AppSpacing.small)
    }
}

extension PlatformBox {
    var titleView : some View {
        Text("Platforms")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.bottom, AppSpacing.tiny)
    }
    var platformIcon : some View {
        HStack {
            Spacer()
            HStack {
                ForEach((platforms ?? []).indices) { index in
                    Image(platforms?[index] ?? AppIcons.imgPC)
                        .resizable()
                        .frame(width: AppSpacing.xLarge, height: AppSpacing.xLarge)
                        .padding(.leading)
                }
            }.padding(.vertical, AppSpacing.normal)
            Spacer()
        }
    }
}

struct StoresBox: View {
    var items: [ItemStore]?
    var body: some View {
        VStack(alignment:.leading) {
            titleView
            ForEach((items ?? []).indices) { i in
                let item = items?[i]
                ItemStoresBox(
                    title: item?.name ?? "",
                    site: item?.domain ?? "",
                    icon: item?.icon ?? ""
                )
            }
        }
        .padding(.all, AppSpacing.regular)
        .background(AppColors.MainColor)
        .cornerRadius(6)
        .padding(.horizontal, AppSpacing.normal)
        .padding(.bottom, AppSpacing.small)
    }
}

extension StoresBox {
    var titleView : some View {
        Text("Stores")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.bottom, AppSpacing.tiny)
    }
}

struct ItemStoresBox: View {
    var title: String?
    var site: String?
    var icon: String?
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text(title ?? "")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text(site ?? "")
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            Spacer()
            if icon != nil {
                Image(icon ?? AppIcons.imgPC)
                    .resizable()
                    .frame(width: AppSpacing.large, height: AppSpacing.large)
            }
        }
        .padding(.all, AppSpacing.regular)
        .background(AppColors.SecondaryColor)
        .cornerRadius(6)
    }
}
