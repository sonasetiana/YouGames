//
//  DetailView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            contentView
        }
        .edgesIgnoringSafeArea(.all)
        .background(AppColors.BackgroudColor)
    }
}

extension DetailView {
    var contentView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                imageView
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
    var imageView : some View {
        ZStack {
            Image(AppIcons.imgGames)
                .resizable()
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
        DetailView()
    }
}
