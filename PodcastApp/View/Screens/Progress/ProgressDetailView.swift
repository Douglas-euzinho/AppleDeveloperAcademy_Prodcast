//
//  ProgressDetailView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailView: View {
    // MARK: - PROPERTIES
    @ObservedObject var episode: Episode
    
    var layout = [
        GridItem(.fixed(130)),
        GridItem(.fixed(130))
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Text("Oba! Atualize o andamento do seu podcast.")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                Spacer()
                
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(episode) { episode in
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
                
            }
        }
        .navigationBarTitle("Progresso", displayMode: .inline)
        .toolbar {
            EditButton()
        }
    }
}

// MARK: - PREVIEW
struct ProgressDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDetailView()
    }
}
