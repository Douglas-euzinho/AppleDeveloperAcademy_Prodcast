//
//  NewEpisodeViewModel.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 07/01/22.
//

import Foundation


class NewEpisodeModel: ObservableObject {
    
    @Published var episode: Episode?
    
    func createEpisode(name: String, date: Date) -> Bool{
        do {
            self.episode = try PersistenceController.shared.createEpisode(title: name, status: 25, date: date)
            return true
        } catch {
            //TODO: - CREATE ERROR
            return false
        }

    }
    
}
