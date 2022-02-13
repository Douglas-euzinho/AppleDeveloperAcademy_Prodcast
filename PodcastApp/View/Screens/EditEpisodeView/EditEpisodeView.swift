//
//  EditEpisodeView.swift
//  ProdCast
//
//  Created by Felipe Brigagão de Almeida on 12/02/22.
//

import SwiftUI

struct EditEpisodeView: View {
    @Binding var showSheetView: Bool
    @State var episodeName: String = ""
    @ObservedObject var model: EpisodeViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color("background-color")
                    .ignoresSafeArea()
                
                VStack {
                    //MARK: - INPUT DATE AND EPISODE THEME
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Nome do Epsódio:")
                                .font(.system(size: 22))
                            
                            TextField("", text: $episodeName)
                                .foregroundColor(.black)
                                .padding(.vertical, 6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black)
                                )
                                .font(Font.system(size: 17, weight: .medium, design: .serif))
                                .background(.white)
                                .padding(.trailing, 20)
                        } //: VSTACK
                    } //: HSTACK
                    .padding(.top, 25)
                    Spacer()
                
                    .navigationBarTitle(Text("Editar"), displayMode: .inline)
                    .navigationBarItems(trailing:
                        Button(action: {
                        if !episodeName.isEmpty {
                            model.episode?.wrappedTitle = episodeName
                            model.save()
                            showSheetView = false
                        }
                        }) {
                            Text("Salvar")
                                .bold()
                                .foregroundColor(Color("accent-color"))
                                .opacity(episodeName.isEmpty ? 0.5 : 1.0)
                        }
                    )
                    .navigationBarItems(leading:
                        Button(action: {
                            showSheetView = false
                        }) {
                            Text("Cancelar")
                                .foregroundColor(Color("accent-color"))
                        }
                    )
                }
                .padding(.leading)
            }
            Spacer()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationViewStyle(.stack)
    }
}

struct EditEpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EditEpisodeView(showSheetView: .constant(true), model: EpisodeViewModel(episode: Episode()))
    }
}
