//
//  DetailGameEntity.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct DetailGameEntity : Decodable {
    var id: Int?
    var slug: String?
    var name: String?
    var name_original: String?
    var description: String?
    var description_raw: String?
    var released: String?
    var background_image: String?
    var rating: Double?
    var website: String?
    var parent_platforms: [PlatformParentEntity]?
    var stores: [StoresEntity]?
    var developers: [GlobalEntity]?
    var genres: [GlobalEntity]?
    var tags: [GlobalEntity]?
    var publishers: [GlobalEntity]?
}
