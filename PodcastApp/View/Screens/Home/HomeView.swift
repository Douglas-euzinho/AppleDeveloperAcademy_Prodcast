//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        NavigationView {
            Text("Hello, World!").padding()
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            print(" ")
                        } label: {
                            Image(systemName: "plus")
                            Text("Add")
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        Spacer()
                    }
                    
                    
                }
        }

        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//
