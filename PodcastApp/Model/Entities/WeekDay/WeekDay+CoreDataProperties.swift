//
//  WeekDay+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 20/01/22.
//
//

import Foundation
import CoreData


extension WeekDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeekDay> {
        return NSFetchRequest<WeekDay>(entityName: "WeekDay")
    }

    @NSManaged public var sunday: Bool
    @NSManaged public var monday: Bool
    @NSManaged public var tuersday: Bool
    @NSManaged public var wednesday: Bool
    @NSManaged public var thursday: Bool
    @NSManaged public var friday: Bool
    @NSManaged public var saturday: Bool
    @NSManaged public var notification: Notification?

}

extension WeekDay : Identifiable {

}
