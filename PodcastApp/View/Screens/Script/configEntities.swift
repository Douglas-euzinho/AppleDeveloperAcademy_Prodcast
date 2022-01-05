//
//  configEntities.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 05/01/22.
//

import SwiftUI

final class configureInitialTopics: ObservableObject{
    @Published var topics: [Topics] = [
        Topics(nameType: "Tema", description: "opa"),
        Topics(nameType: "Vinheta", description: ""),
        Topics(nameType: "Introdução", description: ""),
        Topics(nameType: "Conteúdo", description: ""),
        Topics(nameType: "Comentário", description: ""),
        Topics(nameType: "Finalização", description: "")
    ]
}
