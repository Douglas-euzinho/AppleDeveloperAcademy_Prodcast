//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI

struct NewEpisodeView: View {
    // MARK: - PROPERTIES
    @Binding var showSheetView: Bool
    @State var episodeName: String = ""
    @State var selectedDate = Date()
    @ObservedObject var homeModel: HomeViewModel
    @StateObject var model = NewEpisodeModel()
    
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
                                //.cornerRadius(10)
                                .foregroundColor(.black)
                                .padding(.vertical, 6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 9.5)
                                        .stroke(.black, lineWidth: 2.2)
                                )
                                .font(Font.system(size: 17, weight: .medium, design: .serif))
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.trailing, 20)
                                .cornerRadius(10)
                                
                                
                            
                            
                            //MARK: Select Launch Date
                            Text("Lançamento:")
                                .font(.system(size: 22))

                            DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                                .clipped()
                                .labelsHidden()
                                .accentColor(Color.blue)
                                .frame(alignment: .leading)
                            
                        } //: VSTACK
                    } //: HSTACK
                    .padding(.top, 25)
                    
                    Spacer()
                    
                        .navigationBarTitle(Text("Novo Episódio"), displayMode: .inline)
                        //MARK: Save Action
                        .navigationBarItems(trailing: Button(action: {
                            //TODO: Create action to show episodeView
                            if !episodeName.isEmpty {
                                let _ = model.createEpisode(name: episodeName, date: selectedDate)
                                homeModel.update()
                                showSheetView = false
                            }
                        }) {
                            Text("Salvar").bold()
                                .foregroundColor(Color("accent-color"))
                                .opacity(episodeName.isEmpty ? 0.5 : 1.0)
                        })
                    //MARK: Cancel Action
                        .navigationBarItems(leading: Button(action: {
                            showSheetView = false
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

// MARK: - PREVIEW
struct NewProjectScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NewEpisodeView(showSheetView: .constant(true), episodeName: "Episódio 01", homeModel: HomeViewModel())
    }
}

