//
//  EpisodeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 13/01/22.
//

import Foundation


class EpisodeViewModel: Modelable {
    
    @Published var episode: Episode?
    private var persistence = PersistenceController.shared
    
    init(episode: Episode) {
        self.episode = episode
        update()
    }
    
    //TODO: Create switch case type of script
    func createScript(type: Int) {
        guard let episode = episode else {
            return
        }
        do {
            let _ = try persistence.createScript(typeOfScript: type, episode: episode)
            update()
        } catch {
            
        }
        
    }
    
    func createTopic(title: String) {
        guard let episode = episode else { return }
        do {
            guard let script = episode.script else { return }
            try persistence.createTopic(title: title, script: script)
            update()
        } catch {
            
        }
    }
    
    
    func save() {
        do {
            try persistence.saveContext()
        } catch {
            //TODO: Create a catch 
        }
 
    }
    
    func update() {
        objectWillChange.send()
    }
    
    
}
