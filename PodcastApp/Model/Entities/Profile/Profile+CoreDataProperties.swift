//
//  Profile+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 18/01/22.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var isActiveNotification: Bool
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var notification: Notification?

}

extension Profile : Identifiable {

}
