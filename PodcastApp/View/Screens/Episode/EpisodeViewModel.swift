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
            setupInitialTopics()
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
    

    
    
    func getAllTopics() -> [Topic] {
        guard let topics = episode?.script?.topics?.allObjects as? [Topic] else { return [] }
        
        return topics.sorted{ $0.date ?? Date() < $1.date ?? Date() }
    }
    
    func getFormattedScript() -> String {
        let topics = getAllTopics()
        
        var formattedScript = ""
        
        topics.forEach { topic in
            formattedScript.append("\(topic.content ?? "")")
        }
        return formattedScript
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
    
    
    
    private func setupInitialTopics() {
        createTopic(title: "Tema")
        createTopic(title: "Vinheta")
        createTopic(title: "Introdução")
        createTopic(title: "Conteúdo")
        createTopic(title: "Comentário")
        createTopic(title: "Finalização")
    }
    
    
    deinit {
        print("Deinit EpisodeView Model")
    }
    
}
