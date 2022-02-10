//
//  HomeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 17/12/21.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    var profile: Profile? = {
        return PersistenceController.shared.getProfile()
    }()
    
    @Published var episodes: [Episode] = {
        let episodes = PersistenceController.shared.fetchAllEpisodes()
        return episodes
    }()
    
    func update() {
        self.episodes = PersistenceController.shared.fetchAllEpisodes()
        self.profile = PersistenceController.shared.getProfile()
        objectWillChange.send()
    }
    
}

