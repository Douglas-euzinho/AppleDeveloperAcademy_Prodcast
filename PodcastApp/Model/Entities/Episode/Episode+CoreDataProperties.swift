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
    public var wrappedTitle: String {
        get { return title ?? ""}
        set { title = newValue }
    }
    @NSManaged public var status: Int64
    @NSManaged public var date: Date?
    public var wrappedDate: Date {
        get { return date ?? Date()}
        set { date = newValue}
    }
    @NSManaged public var script: Script?

}

extension Episode : Identifiable {

}
