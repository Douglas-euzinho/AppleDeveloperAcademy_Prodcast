//
//  Persistence.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import CoreData

struct PersistenceController {
    
    static var shared = PersistenceController()
    
    lazy var context: NSManagedObjectContext = {
        let result = PersistenceController()
        let viewContext = result.container.viewContext
        return viewContext
    }()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "PodcastApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    
    //MARK: - EPISODE METHODS
    ///
    /// - Parameters:
    ///   - title: Title of the new episode
    ///   - status: use: 0, 25, 50, 75 or 100 to indicate progress
    ///   - date: date of de episode publication
    /// - Returns: return a object episode
    mutating func createEpisode(title: String, status: Int, date: Date) throws -> Episode {
        let episode = Episode(context: context)
        episode.title = title
        episode.date = date
        episode.status = Int64(status)
        try saveContext()
        return episode
    }
    

    mutating func fetchAllEpisodes() -> [Episode] {
        var episodes: [Episode] = []
        do {
            episodes = try context.fetch(Episode.fetchRequest())
        } catch {
            //CoreDataError.fetchError(error.localizedDescription)
        }
        return episodes
    }
    
    
    
    //MARK: - SCRIPT METHODS
    mutating func createScript(typeOfScript type: Int,episode: Episode) throws -> Script {
        let script = Script(context: context)
        script.type = Int64(type)
        episode.script = script
        try saveContext()
        return script
    }
     
    
    //MARK: - TOPIC METHODS
    mutating func createTopic(title: String, script: Script) throws {
        let topic = Topic(context: context)
        topic.title = title
        script.addToTopics(topic)
        try saveContext()
    }
    
    

    
    //MARK: - USER METHODS
    
    
    
    //MARK: - CORE DATA METHODS
    mutating func saveContext() throws {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //TODO: Create Error ENUM
            }
        }
    }
    
    /// Method that deletes a stored object
    /// - Parameter object: object description
    /// - Returns: returns true if the object is deleted and false if an error occurs in the process
    mutating func deleteObjectInContext(object: NSManagedObject) -> Bool {
        context.delete(object)
        do {
            try saveContext()
            return true
        } catch {
            return false
        }
    }
    
    
}
