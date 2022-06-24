//
//  FavoriteDataSource.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import CoreData

protocol LocalFavoriteDataSource {
    func toFavoriteEntity(data: FavoriteData)
    func getFavoriteEntity(data: FavoriteData) -> FavoriteEntity
    func toFavoriteData(data: FavoriteEntity) -> FavoriteData
    func saveFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func updateFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void)
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void)
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void)
}

class LocalFavoriteDataSourceImpl : LocalFavoriteDataSource {
    
    
    private let coreDataManager : CoreDataManager
    
    init(coreDataManager : CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func toFavoriteEntity(data: FavoriteData) {
        let entity = FavoriteEntity(context: self.coreDataManager.getViewContext())
        entity.id = Int64(data.id)
        entity.name = data.name
        entity.slug = data.slug
        entity.image = data.image
        entity.rating = data.rating
        entity.released = data.released
        entity.genres = data.genres
    }
    
    func getFavoriteEntity(data: FavoriteData) -> FavoriteEntity {
        let entity = FavoriteEntity(context: self.coreDataManager.getViewContext())
        entity.id = Int64(data.id)
        entity.name = data.name
        entity.slug = data.slug
        entity.image = data.image
        entity.rating = data.rating
        entity.released = data.released
        entity.genres = data.genres
        return entity
    }
    
    func toFavoriteData(data: FavoriteEntity) -> FavoriteData{
        return FavoriteData(
            id: Int(data.id),
            slug: data.slug ?? "",
            name: data.name ?? "",
            released: data.released ?? "",
            image: data.image ?? "",
            rating: data.rating,
            genres: data.genres ?? ""
        )
    }
    
    func saveFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        do{
            toFavoriteEntity(data: data)
            try coreDataManager.getViewContext().save()
            completion(.success("Success save to favorite"))
        }catch {
            completion(.failed("Failed save to favorite"))
            print("Error Save CoreData: ", error)
        }
    }
    
    func updateFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        let coreData = coreDataManager.getViewContext()
        do{
            toFavoriteEntity(data: data)
            try coreData.save()
            coreData.refreshAllObjects()
            completion(.success("Success update to favorite"))
        }catch {
            completion(.failed("Failed update to favorite"))
            print("Error Update CoreData: ", error)
            coreData.rollback()
        }
    }
    
    func deleteFavorite(data: FavoriteData, completion: @escaping (BaseResult<String, String>) -> Void) {
        let coreData = coreDataManager.getViewContext()
        do {
            let fetchFavorite : NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
            let results = try coreData.fetch(fetchFavorite)
            results.filter{
                data.id == $0.id
            }.forEach { item in
                coreData.delete(item)
            }
            try coreData.save()
            completion(.success("Success delete to favorite"))
        }catch {
            completion(.failed("Failed delete to favorite"))
            print("Error Delete CoreData: ", error)
            coreData.rollback()
        }
    }
    
    func getListFavorite(completion: @escaping (BaseResult<[FavoriteData], String>) -> Void) {
        do {
            let coreData = coreDataManager.getViewContext()
            let fetchFavorite : NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
            let results = try coreData.fetch(fetchFavorite).map{toFavoriteData(data: $0)}
            completion(.success(results))
        }catch {
            completion(.failed("Failed fetch data favorite"))
            print("Error Fetch CoreData: ", error)
        }
    }
    
    func findFavorite(id: Int, completion: @escaping (BaseResult<FavoriteData, String>) -> Void) {
        do {
            let coreData = coreDataManager.getViewContext()
            let fetchFavorite : NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
            let results = try coreData.fetch(fetchFavorite).map{toFavoriteData(data: $0)}.filter{id == $0.id}
            if results.isEmpty {
                completion(.failed("No favorite founds"))
            } else {
                completion(.success(results.first!))
            }
        }catch {
            completion(.failed("Failed fetch data favorite"))
            print("Error Fetch CoreData: ", error)
        }
    }
}
