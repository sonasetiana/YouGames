//
//  HomeView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct HomeView: View {
    @State var keyword: String = ""
    var body: some View {
        NavigationView {
            VStack {
                toolbarView.padding(.top)
                searchView
                listView
            }
            .background(AppColors.BackgroudColor)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    var toolbarView : some View {
        HStack {
            Image(AppIcons.imgLogo)
                .resizable()
                .frame(width: 96, height: 48)
            Spacer()
            NavigationLink(destination: AppRouters.toProfileView()) {
                Image(AppIcons.imgUser)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }.padding()
    }
    var searchView : some View {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(
                        "Search Your Games",
                        text: $keyword
                    ).foregroundColor(.primary)
                    Button(action : {
                            self.keyword = ""
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .opacity(keyword == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }
            .padding()
        }
    var listView : some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<20) {_ in
                ItemGames()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
