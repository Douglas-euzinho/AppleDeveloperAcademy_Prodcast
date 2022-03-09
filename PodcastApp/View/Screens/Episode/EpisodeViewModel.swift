//
//  EpisodeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 13/01/22.
//

import Foundation


class EpisodeViewModel: Modelable {
    
    @Published var episode: Episode!
    @Published var topics: [Topic]!
    
    init(episode: Episode) {
        self.episode = episode
        self.topics = getAllTopics()
        update()
    }
    
    //TODO: Create switch case type of script
    func createScript(type: Int) {
        guard let episode = episode else {
            return
        }
        do {
            let _ = try PersistenceController.shared.createScript(typeOfScript: type, episode: episode)
            setupInitialTopics()
            update()
        } catch {
            
        }
        
    }
    
    func createTopic(title: String) {
        guard let episode = episode else { return }
        do {
            guard let script = episode.script else { return }
            try PersistenceController.shared.createTopic(title: title, script: script)
            update()
        } catch {
            
        }
    }
    
    
    
    func deleteTopic(topic: Topic) {
        if PersistenceController.shared.deleteObjectInContext(object: topic) {
            update()
        }
    }
    
    

    func deleteEpisode() -> Bool {
        guard let episode = episode else {return false}
        return PersistenceController.shared.deleteObjectInContext(object: episode)
    }
    
    
    func getAllTopics() -> [Topic] {
        guard let topics = episode?.script?.topics?.allObjects as? [Topic] else { return [] }
        
        return topics.sorted{ $0.date ?? Date() < $1.date ?? Date() }
    }
    
    func getFormattedScript() -> String {
        let topics = getAllTopics()
        
        var formattedScript = ""
        
        topics.forEach { topic in
            formattedScript.append("\(topic.wrappedTitle) \n \(topic.content ?? "") \n")
        }
        return formattedScript
    }
    
    
    func save() {
        do {
            try PersistenceController.shared.saveContext()
        } catch {
            //TODO: Create a catch 
        }
 
    }
    
    func update() {
        self.topics = getAllTopics()
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
        save()
        print("Deinit EpisodeView Model")
    }
    
}
