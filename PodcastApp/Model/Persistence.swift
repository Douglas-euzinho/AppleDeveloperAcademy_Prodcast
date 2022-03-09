//
//  Persistence.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import CoreData

class PersistenceController {
    
    static var shared = PersistenceController()
    
    lazy var context: NSManagedObjectContext = {
        let viewContext = container.viewContext
        viewContext.automaticallyMergesChangesFromParent = true
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
                //TODO: Throws an error
                debugPrint(error)
               // fatalError("Unresolved error \(error), \(error.userInfo)")
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
    func createEpisode(title: String, status: Int, date: Date) throws -> Episode {
        let episode = Episode(context: context)
        episode.title = title
        episode.date = date
        episode.status = Int64(status)
        try saveContext()
        return episode
    }
    
    
    /// Method that fetch all stored episodes
    /// - Returns: Return an array of episodes
    func fetchAllEpisodes() -> [Episode] {
        var episodes: [Episode] = []
        do {
            episodes = try context.fetch(Episode.fetchRequest())
        } catch {
            //CoreDataError.fetchError(error.localizedDescription)
        }
        let sortedEpisodes = episodes.sorted { $0.date ?? Date() < $1.date ?? Date() }
        return sortedEpisodes
    }
    
    
    
    //MARK: - SCRIPT METHODS
    func createScript(typeOfScript type: Int,episode: Episode) throws -> Script {
        let script = Script(context: context)
        script.type = Int64(type)
        episode.script = script
        try saveContext()
        return script
    }
    
    
    //MARK: - TOPIC METHODS
    func createTopic(title: String, script: Script) throws {
        let topic = Topic(context: context)
        topic.date = Date()
        topic.title = title
        topic.content = "Texto exemplo"
        script.addToTopics(topic)
        try saveContext()
    }
    
    
    
    
    //MARK: - PROFILE METHODS
    func createProfile() throws -> Profile{
        let profile = Profile(context: context)
        profile.createdDate = Date()
        profile.name = "Meu Podcast"
        profile.isActiveNotification = false
        try saveContext()
        return profile
    }
    
    
    func getProfile() -> Profile {
        var profile: Profile?
        
        do {
            let userCreated = UserDefaults.standard.bool(forKey: "userCreated")
            if userCreated {
                let profiles = try context.fetch(Profile.fetchRequest())
                // Fetch the oldest profile in the coredata and cloudkit
                let profilesSorted = profiles.sorted{ $0.createdDate ?? Date() < $1.createdDate ?? Date() }
                profile = profilesSorted.first!
            } else {
                profile = try createProfile()
                UserDefaults.standard.set(true, forKey: "userCreated")
            }
        } catch {
            //TODO: Create Error
        }
        return profile!
    }
    
    
    
    //MARK: NOTIFICATION METHODS
    func createNotification(title: String, hour: Date, message: String, days: [Bool],profile: Profile) {
        let notification = Notification(context: context)
        notification.profile = profile
        notification.id = UUID()
        notification.title = title
        notification.hour = hour
        notification.message = message
        profile.addToNotifications(notification)
        
        let weekDays = WeekDay(context: context)
        
        weekDays.sunday = days[0]; weekDays.monday = days[1];weekDays.tuersday = days[2];weekDays.wednesday = days[3];weekDays.thursday = days[4]; weekDays.friday = days[5];weekDays.saturday = days[6]
        
        notification.days = weekDays
        do {
            try saveContext()
        } catch {
            
        }
    }
    
    
    //MARK: - CORE DATA METHODS
    func saveContext() throws {
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
    func deleteObjectInContext(object: NSManagedObject) -> Bool {
        context.delete(object)
        do {
            try saveContext()
            return true
        } catch {
            return false
        }
    }
    
    
}
