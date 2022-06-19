//
//  PlatformEntity.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct GlobalEntity : Decodable {
    var id: Int?
    var name: String?
    var slug: String?
}

struct PlatformParentEntity : Decodable {
    var platform: GlobalEntity?
}
