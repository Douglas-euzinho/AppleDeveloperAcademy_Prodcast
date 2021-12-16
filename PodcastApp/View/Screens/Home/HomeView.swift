//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

//--TODO:
//--TODO:
//--TODO:




import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        NavigationView {
        VStack{
            ZStack{
                
                
    
                Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white)
                    .ignoresSafeArea()
                
                
                BgLayer()
                    .position(x: 195, y: 630)
                    .ignoresSafeArea()
                //Foto do perfil
                Circle()
                    .ignoresSafeArea()
                    .frame(width: 62, height: 52)
                    .position(x: 195, y: 20)
                
                //Nome do podcast
                Text("Vida de Estudante ")
                    .position(x: 195, y: 10)
                    .font(.custom("Helvetica Neue", size: 20))
                   
                
                Text("Meus Episódios ")
                    .position(x: 160, y: 109)
                    .font(.custom("Helvetica Neue", size: 28))
                
                
                    
              
                ScrollView {
                    HStack(spacing: 30) {
                        ForEach(0..<2) {_ in
                            CardsEps()
                        }
                    }
                }
                .background(Color.white)
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
        .navigationViewStyle(StackNavigationViewStyle())
        
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//
