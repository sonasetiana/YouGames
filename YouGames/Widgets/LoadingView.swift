//
//  LoadingView.swift
//  YouGames
//
//  Created by sona setiana on 17/06/22.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ProgressView()
            .tint(.white).progressViewStyle(.circular)
    }
}

struct LoadingView: View {
    var body: some View {
        VStack{
            Spacer()
            Loading()
            Spacer()
        }.background(.black)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
