//
//  HomeProjectView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 17/12/21.
//

import SwiftUI

struct EpisodeView: View {
    // MARK: - PROPERTIES
    @State var actualDate: Date
    @ObservedObject var episode: Episode
    // MARK: - BODY
    var body: some View {
            VStack(alignment: .leading) {
                Text("Progresso")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                CardsEpsView(episode: episode)
                    .foregroundColor(.clear)
                
                Text("Roteiro")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                NavigationLink(destination: ScriptFormatView(config: configureInitialTopics())) {
                    GroupBox(label: Label("Resenha", systemImage: "text.justify")
                    ) {
                        ScrollView(.vertical, showsIndicators: false) {
                            Text("Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante. Nesse episódio iremos falar sobre os tipos existente de Alfabetos, para utilizar em seus mapas mentais e materiais de estudos.")
                        }
                    }
                    .frame(maxWidth: 322, maxHeight: 228)
                    .buttonStyle(PlainButtonStyle())
                }
                
                Text("Lançamento")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                    DatePicker("", selection: $actualDate, in: ...Date(), displayedComponents: .date)
                    .tint(.red)
                    .frame(width: 20, alignment: .leading)
            }
        .navigationBarTitle(Text(episode.title ?? "Sem título"))
    }
}

//struct HomeProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeView(actualDate: Date())
//    }
//}
