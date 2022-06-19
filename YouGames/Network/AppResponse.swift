//
//  AppResponse.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct ListResponse<T : Decodable>: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
}

struct ObjectResponse<T : Decodable>: Decodable {
    var method: String?
    var status: Bool?
    var results: T?
}
