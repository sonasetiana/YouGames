//
//  CoreDataManager.swift
//  YouGames
//
//  Created by sona setiana on 24/06/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    private let presistenContainer : NSPersistentContainer
    private let viewContext : NSManagedObjectContext
    
    init() {
        presistenContainer = NSPersistentContainer(name: "YouGamesCoreData")
        presistenContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Core Data Stores Failed \(error.localizedDescription)")
            }
        }
        viewContext = presistenContainer.viewContext
    }
    
    func getViewContext() -> NSManagedObjectContext {
        return viewContext
    }
}
