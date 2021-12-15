//
//  Episode+CoreDataProperties.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 15/12/21.
//
//

import Foundation
import CoreData


extension Episode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Episode> {
        return NSFetchRequest<Episode>(entityName: "Episode")
    }

    @NSManaged public var title: String?
    @NSManaged public var status: Int64
    @NSManaged public var date: Date?
    @NSManaged public var script: Script?

}

extension Episode : Identifiable {

}
