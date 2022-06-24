//
//  PublishersEntity.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct StoreEntity : Decodable {
    var id: Int?
    var name: String?
    var slug: String?
    var domain: String?
}

struct StoresEntity : Decodable {
    var id: Int?
    var url: String?
    var store : StoreEntity?
}

struct ItemStore {
    var name: String?
    var domain: String?
    var icon: String?
}
