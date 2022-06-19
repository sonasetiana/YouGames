//
//  HomeView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    var body: some View {
        NavigationView {
            VStack {
                toolbarView.padding(.top)
                searchView
                if self.presenter.loading {
                    LoadingView()
                } else if !self.presenter.error.isEmpty {
                    ErrorView(
                        message: self.presenter.error,
                        completion: {
                            self.presenter.getListGames()
                        }
                    )
                } else {
                    if self.presenter.items.isEmpty {
                        EmptyView()
                    } else {
                        listView
                    }
                }
            }
            .background(AppColors.BackgroudColor)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .onAppear(perform: {
                self.presenter.getListGames()
            })
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
                        text: $presenter.keyword
                    ).foregroundColor(.primary)
                    Button(action : {
                        self.presenter.keyword = ""
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .opacity(presenter.keyword == "" ? 0 : 1)
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
            LazyVStack {
                let items = self.presenter.items
                ForEach(0..<items.count+1) { i in
                    if i == items.count {
                        Loading().opacity(self.presenter.loadingMore ? 1 : 0)
                    }
                    if i < items.count {
                        let item = items[i]
                        ItemGames(
                            id: item.id ?? 0,
                            imageUrl: item.background_image,
                            releaseAt: item.released,
                            title: item.name,
                            tags: arraysToString(items: item.genres ?? []),
                            rating: String(item.rating ?? 0.0)
                        ).onAppear(perform: {
                            if i == items.count - 2 {
                                print("Nextpage", self.presenter.nextPage)
                                self.presenter.getMoreGames()
                                print("Nextpage", self.presenter.nextPage)
                            }
                        })
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppRouters.toHomeView()
    }
}
