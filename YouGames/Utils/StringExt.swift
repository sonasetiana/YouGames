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

func arrayToPlatforms(items: [PlatformParentEntity]) -> [String]{
    var results: [String] = []
    items.forEach({ item in
        var icon = ""
        switch item.platform?.name {
            case "PC":
                icon = AppIcons.imgPC
            case "PlayStation":
                icon = AppIcons.imgPlayStation
            case "Xbox":
                icon = AppIcons.imgXbox
            default:
                icon = ""
        }
        if(!icon.isEmpty){
            results.append(icon)
        }
    })
    return results
}

func arrayToStores(items: [StoresEntity]) -> [ItemStore] {
    var results : [ItemStore] = []
    items.forEach({ item in
        var icon = ""
        switch item.store?.id {
            case 3:
                icon = AppIcons.imgPlayStation
            case 11:
                icon = AppIcons.imgEpicGame
            case 1:
                icon = AppIcons.imgSteamGame
            case 7:
                icon = AppIcons.imgXbox
            case 2:
                icon = AppIcons.imgXbox
            default:
                icon = ""
        }
        if(!icon.isEmpty){
            let data = ItemStore(name: item.store?.name, domain: item.store?.domain, icon: icon)
            results.append(data)
        }
    })
    return results
}
