//
//  Script+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 15/12/21.
//
//

import Foundation
import CoreData


extension Script {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Script> {
        return NSFetchRequest<Script>(entityName: "Script")
    }

    @NSManaged public var type: Int64
    @NSManaged public var episode: Episode?
    @NSManaged public var topics: NSSet?

}

// MARK: Generated accessors for topics
extension Script {

    @objc(addTopicsObject:)
    @NSManaged public func addToTopics(_ value: Topic)

    @objc(removeTopicsObject:)
    @NSManaged public func removeFromTopics(_ value: Topic)

    @objc(addTopics:)
    @NSManaged public func addToTopics(_ values: NSSet)

    @objc(removeTopics:)
    @NSManaged public func removeFromTopics(_ values: NSSet)

}

extension Script : Identifiable {

}
