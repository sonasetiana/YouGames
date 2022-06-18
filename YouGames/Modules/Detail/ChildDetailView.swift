//
//  ChildDetailView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct ChildDetailView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TitleBox()
                DescriptionBox()
                PlatformBox(
                    platforms: [AppIcons.imgPC, AppIcons.imgXbox, AppIcons.imgNitendo, AppIcons.imgPlayStation]
                )
                DescriptionBox(
                    title: "Tags",
                    description: "Singleplayer, Steam Achievements, Multiplayer, Atmospheric, Full controller support, RPG, Co-OP, Great Soundtrack, Open World, cooperative, First-Person, Third Person"
                )
                StoresBox(
                    stores: [AppIcons.imgPlayStation, AppIcons.imgXbox, AppIcons.imgEpicGame, AppIcons.imgSteamGame]
                )
                DescriptionBox(
                    title: "Developers",
                    description: "Rockstar North, Rockstar Games"
                )
                DescriptionBox(
                    title: "Publishers",
                    description: "Rockstar Games"
                )
                DescriptionBox(
                    title: "Website",
                    description: "http://www.rockstargames.com/V/"
                )
            }
        }
    }
}

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
        HStack {
            Spacer()
            Text(releaseAt ?? "2013-09-17")
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.white)
        }
    }
    var titleView : some View {
        Text(title ?? "Grand Theft Auto V")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
    }
    var tagsView : some View {
        Text(tags ?? "Action,  Adventure")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white)
            .lineLimit(2)
    }
    var ratingView : some View {
        HStack {
            Spacer()
            Image(AppIcons.imgrRating)
                .resizable()
                .frame(width: 16, height: 16)
            Text(rating ?? "4.7")
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
        Text(title ?? "Description ")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.bottom, AppSpacing.tiny)
    }
    var descriptionView : some View {
        Text(description ?? "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update.")
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
    var stores: [String]?
    var body: some View {
        VStack(alignment:.leading) {
            titleView
            ForEach((stores ?? []).indices) { index in
                ItemStoresBox(
                    title: "PlayStation Store",
                    site: "https://store.playstation.com",
                    icon: stores?[index]
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

struct ChildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChildDetailView()
    }
}
