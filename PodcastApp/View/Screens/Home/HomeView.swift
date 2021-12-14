//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

//--TODO: Adjust background layers on other iphones
//--TODO: adjust scrollview spacing
//--TODO: check layout on ipads



import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        NavigationView {
            ZStack{
                Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white)
                    .ignoresSafeArea()
                BgLayers()
              
                ScrollView {
                    HStack(spacing: 30) {
                        ForEach(0..<2) {_ in
                            CardsEps()
                        }
                    }
                }
                .frame(height: 400)
                .position(x: 195, y: 400)
                
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
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//
