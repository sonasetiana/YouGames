//
//  StringExt.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

func arraysToString(items: [GlobalEntity]) -> String {
    if items.isEmpty { return "" }
    var results: [String] = []
    items.forEach({ item in
        results.append(item.name ?? "")
    })
    return results.joined(separator: ", ")
}
