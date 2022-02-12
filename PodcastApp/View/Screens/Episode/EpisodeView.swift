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
    @State var showSheetView = false
    @ObservedObject var episodeViewModel: EpisodeViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    init (episode: Episode) {
        self.episodeViewModel = EpisodeViewModel(episode: episode)
        self.homeViewModel = HomeViewModel()
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("background-color")
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(episodeViewModel.episode?.title ?? "Sem título")
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                        .offset(y: -20)
                    
                    Text("Progresso")
                        .fontWeight(.semibold)
                        .modifier(textFieldTitle())
                    
                    NavigationLink(destination: EmptyView()) {
                        GroupBox {
                            VStack {
                                HStack {
                                    Text("Editar Progresso")
                                        .fontWeight(.semibold)
                                        .font(.subheadline)
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .modifier(groupBoxChevron())
                                } //: HSTACK
                                .foregroundColor(.primary)
                                
                                EpisodeProgressView(episode: episodeViewModel.episode ?? Episode())
                                    .offset(x: -65)
                            } //: VSTACK
                            .padding()
                        } //: GROUP BOX
                        .groupBoxStyle(groupBoxStroked())
                    }
                    .modifier(textFieldPadding())
                    
                    Text("Roteiro")
                        .fontWeight(.semibold)
                        .modifier(textFieldTitle())
                    
                    if episodeViewModel.episode?.script != nil {
                        NavigationLink(destination: ScriptInputInfosView().environmentObject(episodeViewModel)) {
                            GroupBox {
                                VStack {
                                    HStack {
                                        Text("Editar Progresso")
                                            .fontWeight(.semibold)
                                            .font(.subheadline)
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                            .modifier(groupBoxChevron())
                                    } //: HSTACK
                                    ScrollView(.vertical, showsIndicators: false) {
                                        Text(episodeViewModel.getFormattedScript())
                                            .multilineTextAlignment(.leading)
                                    }
                                } //: VSTACK
                                .padding()
                            }
                        }
                        .groupBoxStyle(groupBoxStroked())
                        .modifier(textFieldPadding())
                        .buttonStyle(PlainButtonStyle())
                    } else {
                        GroupBox {
                            VStack {
                                HStack {
                                    //TODO: Change after to Iniciar Teleprompter
                                    Text("Criar Roteiro")
                                        .fontWeight(.semibold)
                                        .font(.subheadline)
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .modifier(groupBoxChevron())
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
                                .buttonStyle(OrangeButton())
                                .padding(.bottom, 8)
                            }
                            .padding()
                        }
                        .groupBoxStyle(groupBoxStroked())
                        .modifier(textFieldPadding())
                    }
                    Text("Lançamento")
                        .fontWeight(.semibold)
                        .modifier(textFieldTitle())
                    
                    DatePicker("", selection: $actualDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.automatic)
                        .accentColor(Color("accent-color"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black)
                        )
                        .labelsHidden()
                        .frame(width: 20, alignment: .leading)
                        .offset(x: 40)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundColor(Color("accent-color"))
                    
                    Text("Excluir Episódio")
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent-color"))
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showSheetView.toggle()
                }) {
                    //TODO: show episode screen
                    Text("Editar").bold()
                        .foregroundColor(Color("accent-color"))
                }
            }
        }
        .sheet(isPresented: $showSheetView) {
            EditEpisodeView(showSheetView: $showSheetView, homeModel: homeViewModel)
        }
    }
}
//}

// MARK: - STYLE MODIFIERS
struct textFieldPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 40)
            .padding(.bottom, 25)
    }
}

struct textFieldTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .padding(.horizontal, 40)
            .padding(.bottom, 10)
    }
}

struct groupBoxChevron: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color("accent-color"))
    }
}

struct OrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 70)
            .padding(.vertical, 7)
            .background(Color("accent-color"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.system(size: 20, weight: .semibold))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black)
            )
    }
}

struct groupBoxStroked: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack{
                configuration.label
            }
            configuration.content
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black)
                )
        }
        .background(Color.white)
    }
}

//struct HomeProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeView(actualDate: Date(), episode: PersistenceController().fetchAllEpisodes().first)
//    }
//}
