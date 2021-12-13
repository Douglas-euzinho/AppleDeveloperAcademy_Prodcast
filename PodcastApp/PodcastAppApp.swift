//
//  PodcastAppApp.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI

@main
struct PodcastAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
