//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    // MARK: - PROPERTIES
    @State var showSheetView = false
    @State var episodeName = ""
    @StateObject var homeViewModel = HomeViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    let screen = UIScreen.main.bounds
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - PROFILE VIEW
                UserProfileView().padding(.top, 50)
                
                ZStack {
                    // MARK: - RADIAL BACKGROUND
                    Rectangle()
                        .cornerRadius(radius: 60, corners: [.topLeft])
                        .foregroundColor(Color("background-color"))
                    
                    VStack {
                        // MARK: - EPISODES
                        Text("Meus Episódios")
                            .font(.custom("", size: 28))
                            .frame(width: 300, alignment: .leading)
                            .padding()
                        
                        ScrollView {
                            //FIXME: Create logic to present cards
                            VStack(spacing: 20) {
                                ForEach(homeViewModel.episodes) { episode in
                                    CardsEpsView(episode: episode)
                                } //: EPISODES
                            } // VSTACK
                        } //: SCROLL VEW
                    } //: VSTACK
                    .padding(.top)
                } //: ZSTACK
                .padding(.top)
            } //: VSTACK
            .ignoresSafeArea()
            .background(Color("secundary-color"))
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button{
                        showSheetView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color("action-color"))
                        Text("Novo Projeto")
                            .foregroundColor(Color("action-color"))
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

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
