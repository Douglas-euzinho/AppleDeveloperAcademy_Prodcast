//
//  Profile+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 02/02/22.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var image: Data?
    @NSManaged public var isActiveNotification: Bool
    @NSManaged public var name: String?
    public var wrappedName: String {
        get { return name ?? "No name"}
        set { name = newValue}
    }
    @NSManaged public var notifications: NSSet?

}

// MARK: Generated accessors for notifications
extension Profile {

    @objc(addNotificationsObject:)
    @NSManaged public func addToNotifications(_ value: Notification)

    @objc(removeNotificationsObject:)
    @NSManaged public func removeFromNotifications(_ value: Notification)

    @objc(addNotifications:)
    @NSManaged public func addToNotifications(_ values: NSSet)

    @objc(removeNotifications:)
    @NSManaged public func removeFromNotifications(_ values: NSSet)

}

extension Profile : Identifiable {

}
