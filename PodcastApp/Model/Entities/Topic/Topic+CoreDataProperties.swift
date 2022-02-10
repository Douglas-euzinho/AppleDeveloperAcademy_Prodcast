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
    @NSManaged public var date: Date?
    @NSManaged public var title: String?
    @NSManaged public var script: Script?

}

extension Topic : Identifiable {

}
