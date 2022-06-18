//
//  ChildHomeView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct ChildHomeView: View {
    var body: some View {
        ItemGames()
    }
}

struct ItemGames: View {
    var imageUrl: String?
    var releaseAt: String?
    var title: String?
    var tags: String?
    var rating: String?
    var body: some View {
        NavigationLink(destination: AppRouters.toDetailView) {
            ZStack {
                backgroudView
                HStack {
                    imageView
                    VStack(alignment:.leading) {
                        dateView
                        titleView
                        tagsView
                        ratingView
                    }.padding(.horizontal, AppSpacing.normal)
                    Spacer()
                }
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.bottom, AppSpacing.medium)
        }
    }
}

extension ItemGames {
    var backgroudView : some View {
        RoundedRectangle(cornerRadius: 6)
            .foregroundColor(AppColors.MainColor)
                            .frame(height: 96)
    }
    var imageView : some View {
        Image(AppIcons.imgGames)
            .resizable()
            .frame(width: 104, height: 96)
            .cornerRadius(6, corners: [.topLeft, .bottomLeft])
    }
    var dateView : some View {
        Text(releaseAt ?? "2013-09-17")
            .font(.system(size: 10, weight: .light))
            .foregroundColor(.white)
    }
    var titleView : some View {
        Text(title ?? "Grand Theft Auto V")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
    }
    var tagsView : some View {
        Text(tags ?? "Action,  Adventure")
            .font(.system(size: 10, weight: .regular))
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

struct ChildHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChildHomeView()
    }
}
