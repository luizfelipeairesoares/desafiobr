//
//  PersistenceManager.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    private init() {}
    
    static let sharedInstance = PersistenceManager()
    
    // MARK: - CoreData Stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let momd = "BrasileiraoDB"
        
        guard let modelURL = Bundle.main.url(forResource: momd, withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing object model from \(modelURL)")
        }
        
        let container = NSPersistentContainer(name: momd, managedObjectModel: mom)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    // MARK: - Core Data Saving support
    lazy var context: NSManagedObjectContext = {
        self.persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return self.persistentContainer.viewContext
    }()
    
    func save() {
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete<T: NSManagedObject>(_ object: T) {
        self.context.delete(object)
    }
    
    internal func cleanDB<T: NSManagedObject>(_ objectType: T.Type) {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try self.context.execute(deleteRequest)
            print("Cleaned")
        }catch (let error) {
            print(error)
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil) -> [T] {
        let entityName = String(describing: objectType)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = predicate
        
        do {
            let fetchedObjects = try self.context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch (let error) {
            print(error)
            return [T]()
        }
    }
    
    func alreadyExists<T: NSManagedObject>(_ objectType: T.Type) -> Bool {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            if let result = try self.context.fetch(fetchRequest) as? [T] {
                return result.count > 0
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}
