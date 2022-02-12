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
    @ObservedObject var homeModel: HomeViewModel
    //@StateObject var model = NewEpisodeModel()
    
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
                        .navigationBarItems(trailing: Button(action: {
                            
                        }) {
                            //TODO: show episode screen
                            Text("Salvar").bold()
                                .foregroundColor(Color("accent-color"))
                        })
                        .navigationBarItems(leading: Button(action: {
                            
                        }) {
                            Text("Cancelar")
                                .foregroundColor(Color("accent-color"))
                        })
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
        EditEpisodeView(showSheetView: .constant(true), homeModel: HomeViewModel())
    }
}
