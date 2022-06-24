//
//  HomeView.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            VStack {
                toolbarView.padding(.top)
                searchView
                if self.viewModel.loading {
                    LoadingView()
                } else if !self.viewModel.error.isEmpty {
                    ErrorView(
                        message: self.viewModel.error,
                        completion: {
                            self.viewModel.getListGames()
                        }
                    )
                } else {
                    if self.viewModel.items.isEmpty {
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
                if self.viewModel.keyword.isEmpty {
                    self.viewModel.getListGames()
                } else  {
                    self.viewModel.keyword = ""
                }
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
            NavigationLink(destination: AppModule.init().provideFavoriteView) {
                Image(AppIcons.imgFavorite)
                    .resizable()
                    .frame(width: 24, height: 24)
            }.padding(.trailing)
            NavigationLink(destination: AppModule.init().provideProfileView) {
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
                        text: $viewModel.keyword
                    ).foregroundColor(.primary)
                    Button(action : {
                        self.viewModel.keyword = ""
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .opacity(viewModel.keyword == "" ? 0 : 1)
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
                ForEach(0..<self.viewModel.items.count+1, id: \.self) { i in
                    if i == self.viewModel.items.count {
                        Loading().opacity(self.viewModel.loadingMore ? 1 : 0)
                    }
                    if i < self.viewModel.items.count {
                        let item = self.viewModel.items[i]
                        ItemGameView(
                            id: item.id ?? 0,
                            imageUrl: item.background_image,
                            releaseAt: item.released,
                            title: item.name,
                            tags: arraysToString(items: item.genres ?? []),
                            rating: String(item.rating ?? 0.0)
                        ).onAppear(perform: {
                            if i == self.viewModel.items.count - 2 {
                                self.viewModel.getMoreGames()
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
        AppModule.init().provideHomeView()
    }
}
