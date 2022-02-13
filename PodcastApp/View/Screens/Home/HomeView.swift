//
//  ContentView.swift
//  PodcastApp
//
//  Created by Victor Brito on 09/12/21.
//

import SwiftUI

struct HomeView: View {
    
    
    // MARK: - PROPERTIES
    @State var orientation: UIDeviceOrientation
    @State private var searchText: String = ""
    @State var searching = false
    @State private var showSheetView = false
    @State private var showProfileView = false
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
                ZStack{
                    NavigationLink(destination: ConfigView(), isActive: $showProfileView) {
                        
                    }
                    Color("background-color").edgesIgnoringSafeArea(.bottom)
                    ZStack {
                        Color("secundary-color").edgesIgnoringSafeArea(.top)
                        VStack {
                            // MARK: - PROFILE VIEW
                            HStack {
                                UserProfileView(name: homeViewModel.profile.wrappedName, image: homeViewModel.profile.image?.toUIImage())
                                    .onAppear(perform: {
                                        homeViewModel.update()
                                    })
                                    .padding(.top, 60)
                                    .padding(.bottom, 10)
                                    .padding(.leading, 25)
                                Spacer()
                            }
                            ZStack {
                                // MARK: - RADIAL BACKGROUND
                                Rectangle()
                                    .cornerRadius(radius: 40, corners: [.topLeft])
                                    .foregroundColor(Color("background-color"))
                                    .frame(minHeight: 620)
                                
                                VStack {
                                    Spacer()
                                    // MARK: - EPISODES
                                    
                                    /*
                                     Regular = Portrait(em pé).
                                     Compact = Landscape(deitado) -> iPhone
                                     */
                                    
                                    if UIDevice.current.localizedModel == "iPad"{
                                        
                                        if orientation.isPortrait{
                                            Text("Meus Episódios")
                                                .font(.custom("", size: 28))
                                                .frame(width: bounds.size.width-80, height: 55, alignment: .bottomLeading)
                                                .padding(10)
                                            Searchbar(searchText: $searchText, searching: $searching)
                                                .frame(alignment: .leading)
                                                .padding(12)
                                            
                                            ScrollView {
                                                LazyVGrid(columns: columns, spacing: 20) {
                                                    ForEach(homeViewModel.episodes.filter { $0.wrappedTitle.contains(searchText) || searchText.isEmpty}) { episode in
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
                                            Searchbar(searchText: $searchText, searching: $searching)
                                                .frame(alignment: .leading)
                                                .padding(12)
                                            
                                            ScrollView {
                                                LazyVGrid(columns: columns, spacing: 20) {
                                                    ForEach(homeViewModel.episodes.filter { $0.wrappedTitle.contains(searchText) || searchText.isEmpty}) { episode in
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
                                        
                                        Spacer()
                                        
                                        Text("Meus Episódios")
                                            .font(.system(size: 26))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 1)
                                            .frame(width: bounds.size.width-70, height: 40, alignment: .bottomLeading)
                                        Searchbar(searchText: $searchText, searching: $searching)
                                            .frame(alignment: .leading)
                                            .padding(.horizontal, 16)
                                        
                                        ScrollView {
                                            LazyVGrid(columns: columns, spacing: 20) {
                                                ForEach(homeViewModel.episodes.filter { $0.wrappedTitle.contains(searchText) || searchText.isEmpty}) { episode in
                                                    NavigationLink {
                                                        EpisodeView(episode: episode)
                                                    } label: {
                                                        CardsEpsView(episode: episode)
                                                    }
                                                }
                                            }
                                            .padding(.top, 15)
                                            .padding(.horizontal)
                                            .offset(x: 30)
                                        }
                                        .frame(maxHeight: 500)
                                    }//End else if
                                }
                                
                                
                            } //: VSTACK
                            .padding(.top)
                        } //: ZSTACK
                        .padding(.top)
                        .toolbar {
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    showProfileView = true
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(Color("accent-color"))
                                }
                            }
                            
                            ToolbarItem(placement: .bottomBar) {
                                Button{
                                    showSheetView.toggle()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color("accent-color"))
                                    
                                    Text("Novo Episódio")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("accent-color"))
                                }
                            }
                            
                            ToolbarItem(placement: .bottomBar) {
                                Spacer()
                            }
                        }
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    }
                    .ignoresSafeArea()
                    .onTapGesture {
                        self.hideKeyboard()
                    } //Update episode list
                    .onAppear {
                        homeViewModel.update()
                    }
                }
                //zstack
            }
            .ignoresSafeArea()
            
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showSheetView) {
            NewEpisodeView(showSheetView: $showSheetView, homeModel: homeViewModel)
        }
        .accentColor(Color("accent-color"))
        .ignoresSafeArea()
        .background(Color("secundary-color"))
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(orientation: .portrait)
            .previewDevice("iPhone 12")
        
    }
}
