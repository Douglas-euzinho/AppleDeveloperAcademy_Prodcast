//
//  ConfigViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 27/01/22.
//

import Foundation

class ConfigViewModel: Modelable {
    
    @Published var profile: Profile
    
    init() {
        self.profile = PersistenceController.shared.getProfile() ?? Profile()
    }
    
    func update() {
        objectWillChange.send()
    }
    
    
    func createNotification(days: [Bool], hour: Date, title: String, message: String) {
       
        PersistenceController.shared.createNotification(title: title, hour: hour, message: message, days: days, profile: profile)
    }
    
    
    
    
    func save() {
        do {
           try PersistenceController.shared.saveContext()
        } catch {
            //TODO: Create Error
        }
       
    }
    
    
    deinit {
        save()
    }
    
}
