//
//  ScriptEntities.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 05/01/22.
//

import Foundation


class Topics: Identifiable, ObservableObject{
    var id = UUID()
    var nameType: String
    var description: String
    
    init(nameType: String, description: String){
        self.nameType = nameType
        self.description = description
    }
}
