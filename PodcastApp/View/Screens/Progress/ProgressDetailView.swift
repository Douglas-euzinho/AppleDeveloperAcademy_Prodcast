//
//  ProgressDetailView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailView: View {
    // MARK: - PROPERTIES
    //@ObservedObject var episode: Episode
    @EnvironmentObject var model: EpisodeViewModel
    
    var layout = [
        GridItem(.flexible(minimum: 100, maximum: 150)),
        GridItem(.flexible(minimum: 100, maximum: 150))
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color("background-color")
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text("Oba! Atualize o andamento do seu podcast.")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        
                    LazyVGrid(columns: layout, spacing: 35) {
                        ProgressDetailCheckboxView(title: "Roteirizado", imageName: "scriptedProgress", marked:  25)
                        //    .opacity(model.episode.status < 25 ? 0.5 : 1.0)
                            .environmentObject(model)
                        ProgressDetailCheckboxView(title: "Gravado", imageName: "recordedProgress", marked: 50)
                            .opacity(model.episode.status >= 25 ? 1.0 : 0.5)
                            .environmentObject(model)
                        ProgressDetailCheckboxView(title: "Editado", imageName: "editedProgress", marked: 75)
                            .opacity(model.episode.status >= 50 ? 1.0 : 0.5)
                            .environmentObject(model)
                        ProgressDetailCheckboxView(title: "Lançado", imageName: "postedProgress", marked: 100)
                            .opacity(model.episode.status >= 75 ? 1.0 : 0.5)
                            .environmentObject(model)
                    }
                    .frame(minHeight: 500)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarTitle("Progresso", displayMode: .inline)
    }
}

//// MARK: - PREVIEW
//struct ProgressDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressDetailView()
//    }
//}
