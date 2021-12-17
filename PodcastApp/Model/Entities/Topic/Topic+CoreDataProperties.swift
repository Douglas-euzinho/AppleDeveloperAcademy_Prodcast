//
//  Topic+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 15/12/21.
//
//

import Foundation
import CoreData


extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var script: Script?

}

extension Topic : Identifiable {

}
