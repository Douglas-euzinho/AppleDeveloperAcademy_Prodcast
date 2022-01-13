//
//  Topic+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 13/01/22.
//
//

import Foundation
import CoreData


extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var content: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var script: Script?

}

extension Topic : Identifiable {

}
