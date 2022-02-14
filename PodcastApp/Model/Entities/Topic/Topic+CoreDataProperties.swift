//
//  Topic+CoreDataProperties.swift
//  ProdCast
//
//  Created by Igor Samoel da Silva on 09/02/22.
//
//

import Foundation
import CoreData


extension Topic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topic> {
        return NSFetchRequest<Topic>(entityName: "Topic")
    }

    @NSManaged public var content: String?
    public var wrappedContent: String {
        get { content ?? ""}
        set { content = newValue}
    }
    @NSManaged public var date: Date?
    @NSManaged public var title: String?
    public var wrappedTitle: String {
        get { title ?? ""}
        set { title = newValue}
    }
    @NSManaged public var script: Script?

}

extension Topic : Identifiable {

}
