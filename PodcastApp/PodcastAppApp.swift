//
//  PodcastAppApp.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI

@main
struct PodcastAppApp: App {
    let persistenceController = PersistenceController()
    var config = configureInitialTopics()

    var body: some Scene {
        WindowGroup {
            HomeView(orientation: .portrait)
            //ScriptFormatView(config: config)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
