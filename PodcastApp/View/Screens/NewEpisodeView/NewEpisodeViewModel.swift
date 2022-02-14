//
//  NewEpisodeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 07/01/22.
//

import Foundation


class NewEpisodeModel: Modelable {
    
    @Published var episode: Episode?
    
    func createEpisode(name: String, date: Date) -> Bool{
        do {
            self.episode = try PersistenceController.shared.createEpisode(title: name, status: 0, date: date)
            return true
        } catch {
            //TODO: - CREATE ERROR
            return false
        }

    }
    
    
    func save() {
        do {
            try PersistenceController.shared.saveContext()
        } catch {
            //TODO: Create catch
        }
        
    }
    
    func update() {
        objectWillChange.send()
    }

    
}
