//
//  NetImage.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import SwiftUI

struct NetImageView: View {
    var url: String
    var width: Double = 100
    var height: Double = 100
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            scale: 2
        ) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }.frame(width: width, height: height)
    }
}
