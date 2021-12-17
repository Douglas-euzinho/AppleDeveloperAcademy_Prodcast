//
//  HomeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 17/12/21.
//

import Foundation


class HomeViewModel: ObservableObject {
     
    init() {
        do {
            _ = try PersistenceController.shared.createEpisode(title: "Episode \(Int.random(in: 1...100))", status: randomProgress(), date: Date())
        } catch {
            print("Erro ao criar episodio")
        }
    }
    
    @Published var episodes: [Episode] = {
        let episodes = PersistenceController.shared.fetchAllEpisodes()
        return episodes
    }()
    
    
}

func randomProgress() -> Int{
    let progress = [0,25,50,100]
    return progress[Int.random(in: 0...3)]
}
