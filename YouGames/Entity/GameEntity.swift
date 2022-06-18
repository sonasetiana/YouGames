//
//  GameEntity.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct GameEntity : Decodable {
    var id: Int?
    var slug: String?
    var name: String?
    var released: String?
    var background_image: String?
    var rating: Double?
    var genres: [GlobalEntity]?
}
