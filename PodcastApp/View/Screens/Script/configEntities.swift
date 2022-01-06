//
//  configEntities.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 05/01/22.
//

import SwiftUI

class configureInitialTopics: ObservableObject{
    @Published var topics: [Topics] = [
        Topics(nameType: "Tema", description: "opa"),
        Topics(nameType: "Vinheta", description: "a"),
        Topics(nameType: "Introdução", description: "b"),
        Topics(nameType: "Conteúdo", description: "c"),
        Topics(nameType: "Comentário", description: "d"),
        Topics(nameType: "Finalização", description: "e")
    ]
}
