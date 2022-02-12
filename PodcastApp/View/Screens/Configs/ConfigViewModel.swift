//
//  ConfigViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 27/01/22.
//

import Foundation

class ConfigViewModel: Modelable {
    
    
    @Published var profile: Profile = {
        return PersistenceController.shared.getProfile()
    }()
    

    
    func update() {
        self.profile = PersistenceController.shared.getProfile()
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
        print("DEINIT Config View Model")
    }
    
}
