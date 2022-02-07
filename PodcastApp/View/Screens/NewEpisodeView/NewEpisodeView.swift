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
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Tema do Epsódio:").bold()
                            .font(.system(size: 22))
                        
                        TextField("Nome do Episódio", text: $episodeName)
                            .foregroundColor(.black)
                            .padding(10)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color.init(uiColor: UIColor.init(named: "TextField") ?? UIColor.white)))
                        
                    } //: VSTACK
                } //: HSTACK
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Data Prevista Para Lançamento:")
                            .bold()
                            .font(.system(size: 22))
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .clipped()
                            .labelsHidden()
                            .accentColor(Color.blue)
                            .frame(alignment: .leading)
                        
                    } //: VSTACK
                } //: HSTACK
                
                //TODO: add date format
                
                Spacer()
                
                    .navigationBarTitle(Text("Novo Episódio"), displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        let _ = model.createEpisode(name: episodeName, date: selectedDate)
                        homeModel.update()
                        showSheetView = false
                    }) {
                        //TODO: show episode screen
                        Text("Salvar").bold()
                            .foregroundColor(Color.black)
                    })
                    .navigationBarItems(leading: Button(action: {
                        showSheetView = false
                    }) {
                        Text("Cancelar")
                            .foregroundColor(Color.black)
                    })
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

