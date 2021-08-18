//
//  StorageManager.swift
//  The Cat App
//
//  Created by SummeR on 14.08.2021.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: Core Data stack
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Favorite_Cat")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    
    func fetchData(completion: (Result<[FavoriteCat], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<FavoriteCat> = FavoriteCat.fetchRequest()
        do {
            let favoriteCats = try viewContext.fetch(fetchRequest)
            completion(.success(favoriteCats))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    //MARK: Save and delete Data
    func save(_ favoriteCatURL: String) {
        let favoriteCat = FavoriteCat(context: viewContext)
        favoriteCat.catImage = favoriteCatURL
        saveContext()
    }
        
    func delete(_ cat: FavoriteCat) {
        viewContext.delete(cat)
        saveContext()
    }
    
    // MARK: CoreData saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}



