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
        ScrollView {
            VStack(alignment: .leading) {
                Text(episodeViewModel.episode?.title ?? "Sem título")
                    .font(.title)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 15)
                
                Text("Progresso")
                    .font(.title2)
                    .padding(.horizontal, 25)
                
                NavigationLink(destination: ProgressDetailView()) {
                    GroupBox {
                        VStack {
                            HStack {
                                Text("Editar Progresso")
                                    .font(.subheadline)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.primary)
                            
                            EpisodeProgressView(episode: episodeViewModel.episode ?? Episode())
                                .offset(x: -65)
                        }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 25)
                
                Text("Teleprompter")
                    .font(.title2)
                    .padding(.horizontal, 25)
                
                if episodeViewModel.episode?.script != nil {
                    NavigationLink(destination: ScriptFormatView().environmentObject(episodeViewModel)) {
                        GroupBox(label: Label("Resenha", systemImage: "text.justify")
                        ) {
                            ScrollView(.vertical, showsIndicators: false) {
                                Text("Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante. Nesse episódio iremos falar sobre os tipos existente de Alfabetos, para utilizar em seus mapas mentais e materiais de estudos.")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 25)
                        .buttonStyle(PlainButtonStyle())
                        .frame(minHeight: 200)
                    }
                } else {
                    GroupBox {
                        VStack {
                            HStack {
                                Text("Iniciar Teleprompter")
                                    .font(.subheadline)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.primary)
                            
                            Image(systemName: "book.circle.fill")
                                .resizable()
                                .padding()
                                .frame(width: 100, height: 100, alignment: .center)
                            
                            Button {
                                episodeViewModel.createScript(type: 1)
                            } label: {
                                Text("Iniciar")
                            }
                            .buttonStyle(BlueButton())
                            .padding(.bottom, 8)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 25)
                }
                
                Text("Lançamento")
                    .font(.title2)
                    .padding(.horizontal, 25)
                
                DatePicker("", selection: $actualDate, in: ...Date(), displayedComponents: .date)
                    .foregroundColor(Color.red)
                    .frame(width: 20, alignment: .leading)
                    .offset(x: 15)
                
            }
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 70)
            .padding(.vertical, 7)
            .background(Color("blue-button"))
            .foregroundColor(.white)
            .cornerRadius(40)
    }
}

//struct HomeProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeView(actualDate: Date(), episode: PersistenceController().fetchAllEpisodes().first)
//    }
//}
