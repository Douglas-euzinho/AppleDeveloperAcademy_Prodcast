//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @State var showSheetView = false
    @State var episodeName = ""
    
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
                    Button{
                        showSheetView.toggle()
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
        .sheet(isPresented: $showSheetView) {
            NewEpisodeView(showSheetView: $showSheetView, episodeName: $episodeName)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//
