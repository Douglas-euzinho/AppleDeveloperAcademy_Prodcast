//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.verticalSizeClass) var heigthSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    @State var orientation: UIDeviceOrientation
    
    // MARK: - PROPERTIES
    @State var showSheetView = false
    @StateObject var homeViewModel = HomeViewModel()
    let screen = UIScreen.main.bounds
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.flexible()),
    ]
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { bounds in
            NavigationView {
                
                VStack {
                    // MARK: - PROFILE VIEW
                    UserProfileView().padding(.top, bounds.safeAreaInsets.top-80)
                    
                    ZStack {
                        // MARK: - RADIAL BACKGROUND
                        Rectangle()
                            .cornerRadius(radius: 60, corners: [.topLeft])
                            .foregroundColor(Color("background-color"))
                        
                        VStack {
                            // MARK: - EPISODES
                            
                            /*
                            //Regular = Portrait(em pé). Compact = Landscape(deitado) -> iPhone
                            if heigthSizeClass == .regular{
                            }else if heigthSizeClass == .compact{
                            }*/
                            
                            if UIDevice.current.localizedModel == "iPad"{
                                
                                if orientation.isPortrait{
                                    Text("Meus Episódios")
                                        .font(.custom("", size: 28))
                                        .frame(width: bounds.size.width-80, height: 55, alignment: .bottomLeading)
                                        .padding(10)
                                    Searchbar()
                                        .frame(alignment: .leading)
                                        .padding(12)
                                    
                                    ScrollView {
                                        LazyVGrid(columns: columns, spacing: 20) {
                                            ForEach(homeViewModel.episodes) { episode in
                                                NavigationLink {
                                                    EpisodeView(episode: episode)
                                                } label: {
                                                    CardsEpsView(episode: episode)
                                                }
                                                
                                            }
                                        }
                                        .padding(.horizontal)
                                        .offset(x: 100)
                                    }
                                    .frame(maxHeight: 680)
                                    
                                }else if orientation.isLandscape{
                                    
                                    Text("Meus Episódios")
                                        .font(.custom("", size: 28))
                                        .frame(width: bounds.size.width-80, height: 46, alignment: .bottomLeading)
                                        .padding(10)
                                    Searchbar()
                                        .frame(alignment: .leading)
                                        .padding(12)
                                    
                                    ScrollView {
                                        LazyVGrid(columns: columns, spacing: 20) {
                                            ForEach(homeViewModel.episodes) { episode in
                                                NavigationLink {
                                                    EpisodeView(episode: episode)
                                                } label: {
                                                    CardsEpsView(episode: episode)
                                                }
                                                
                                            }
                                        }
                                        .padding(.horizontal)
                                        .offset(x: 230)
                                    }
                                    .frame(maxHeight: 480)
                                }
                            }else if UIDevice.current.localizedModel == "iPhone"{
                                
                                Text("Meus Episódios")
                                    .font(.custom("", size: 28))
                                    .frame(width: bounds.size.width-70, height: 40, alignment: .bottomLeading)
                                    .padding(10)
                                Searchbar()
                                    .frame(alignment: .leading)
                                    .padding(12)
                                
                                    ScrollView {
                                        LazyVGrid(columns: columns, spacing: 20) {
                                            ForEach(homeViewModel.episodes) { episode in
                                                NavigationLink {
                                                    EpisodeView(episode: episode)
                                                } label: {
                                                    CardsEpsView(episode: episode)
                                                }
                                                
                                            }
                                        }
                                        .padding(.horizontal)
                                        .offset(x: 30)
                                    }
                                    .frame(maxHeight: 500)
                                }//fim else if
                            }
                            
                            
                        } //: VSTACK
                        .padding(.top)
                    } //: ZSTACK
                    .padding(.top)
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

                } //: VSTACK
                .ignoresSafeArea()
                .background(Color("secundary-color"))
            }
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showSheetView) {
                NewEpisodeView(showSheetView: $showSheetView, homeModel: homeViewModel)
        }
        }
    }


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(orientation: .portrait)
            .previewDevice("iPhone 12")

    }
}
