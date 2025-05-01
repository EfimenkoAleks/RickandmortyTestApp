//
//  CoreDataManager.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 01.05.2025.
//

import Foundation
import CoreData

final class CoreDataManager {

    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init() {
        persistentContainer = NSPersistentContainer(name: "RickandmortyTestApp")

        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved Core Data error \(error), \(error.userInfo)")
            }
        }
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved Core Data saving error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addModel(models: [Morty]) {
  
        models.forEach { model in
            let newModel = MortyData(context: context)
            newModel.name = model.name
            newModel.gender = model.gender
            newModel.type = model.type
            newModel.species = model.species
            newModel.status = model.status
            newModel.image = model.image
        }

        do {
            try context.save()
            print("Saved successfully")
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }
    
    func fetchModel() -> [Morty] {
        var mortys: [Morty] = []
    //    let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<MortyData> = MortyData.fetchRequest()

        do {
            let models = try context.fetch(fetchRequest)
            for person in models {
                let morty = Morty(image: person.image, name: person.name, status: person.status, species: person.species, type: person.type, gender: person.gender)
                mortys.append(morty)
            }
            return mortys
        } catch {
            print("Failed to fetch: \(error.localizedDescription)")
            return []
        }
    }
}
