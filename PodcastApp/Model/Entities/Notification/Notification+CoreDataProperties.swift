//
//  Notification+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 20/01/22.
//
//

import Foundation
import CoreData


extension Notification {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notification> {
        return NSFetchRequest<Notification>(entityName: "Notification")
    }

    @NSManaged public var hour: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var message: String?
    @NSManaged public var title: String?
    @NSManaged public var profile: Profile?
    @NSManaged public var days: WeekDay?

}

extension Notification : Identifiable {

}
