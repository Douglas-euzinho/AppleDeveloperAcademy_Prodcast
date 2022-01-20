//
//  HomeProjectView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 17/12/21.
//

import SwiftUI

struct EpisodeView: View {
    // MARK: - PROPERTIES
    @State var actualDate = Date()
    @ObservedObject var episodeViewModel: EpisodeViewModel
    
    init (episode: Episode) {
        self.episodeViewModel = EpisodeViewModel(episode: episode)
    }
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text("Progresso")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.vertical, 15)
            
           StatesOfPodcast(episode: episodeViewModel.episode ?? Episode())
            
            Text("Roteiro")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.vertical, 15)
            if episodeViewModel.episode?.script != nil {
                NavigationLink(destination: ScriptFormatView().environmentObject(episodeViewModel)) {
                    GroupBox(label: Label("Resenha", systemImage: "text.justify")
                    ) {
                        ScrollView(.vertical, showsIndicators: false) {
                            Text("Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante. Nesse episódio iremos falar sobre os tipos existente de Alfabetos, para utilizar em seus mapas mentais e materiais de estudos.")
                        }
                    }
                    .frame(maxWidth: 322, maxHeight: 228)
                    .buttonStyle(PlainButtonStyle())
                }
           
            } else {
                Button {
                    episodeViewModel.createScript(type: 1)
                } label: {
                    Text("Criar Roteiro")
                }

            }
            
            Text("Lançamento")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.vertical, 15)
            
            DatePicker("", selection: $actualDate, in: ...Date(), displayedComponents: .date)
                .tint(.red)
                .frame(width: 20, alignment: .leading)
        }
        .navigationBarTitle(Text(episodeViewModel.episode?.title ?? "Sem título"))
    }
}

//struct HomeProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeView(actualDate: Date(), episode: PersistenceController().fetchAllEpisodes().first)
//    }
//}
