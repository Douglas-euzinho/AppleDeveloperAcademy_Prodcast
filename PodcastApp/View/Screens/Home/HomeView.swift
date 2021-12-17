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
    let screen = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            VStack{
                UserProfileView().padding(.top, 50)
                ZStack{
                    Rectangle()
                        .cornerRadius(radius: 60, corners: [.topLeft])
                        .foregroundColor(.white)
                    VStack{
                        //FIXME: TEXT LEADING 
                            Text("Meus Episódios")
                                .font(.custom("", size: 30))
                        ScrollView{
                            //FIXME: Create logic to present cards
                            HStack(spacing: 20){
                                ForEach(0..<2) { _ in
                                    CardsEpsView()
                                }
                            }
                            
                        }
                    }
                    .padding(.top)
                }
                .padding(.top)
            }
            .ignoresSafeArea()
            .background(.gray)
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //TODO: CREATE ACTION TO ADD NEW EPISODE
                        print("")
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.black)
                        Text("Novo Projeto")
                            .foregroundColor(.black)
                    }
                    
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
//
