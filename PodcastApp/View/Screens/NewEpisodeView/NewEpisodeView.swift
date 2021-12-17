//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI

struct NewEpisodeView: View {
    @Binding var showSheetView: Bool
    @Binding var episodeName: String
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack{
                
                HStack{
                    VStack{
                        Text("Tema do Epsódio:").bold()
                        TextField("Nome do Episódio", text: $episodeName)
                            .padding(10)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            .background(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(Color.init(uiColor: UIColor.init(named: "TextField") ?? UIColor.white))
                    }
                }
                
                .padding(25)
                
                HStack{
                    VStack{
                        Text("Data Prevista Para Lançamento:").bold()
                    }
                }
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .clipped()
                    .labelsHidden()
                    .accentColor(Color.blue)
                    .frame(width: .infinity, alignment: .leading)
                //FIXME: add date format
                
                Spacer()
                
                    .navigationBarTitle(Text("Novo Projeto"), displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        showSheetView = false
                    }) {
                        //TODO: show episode screen
                        Text("Salvar").bold()
                            .foregroundColor(Color.black)
                    })
                    .navigationBarItems(leading: Button(action: {
                        showSheetView = false
                    }) {
                        Text("Cancelar").bold()
                            .foregroundColor(Color.black)
                    })
            }
            Spacer()
        }
    }
}


struct NewProjectScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NewEpisodeView(showSheetView: .constant(true), episodeName: .constant("Episódio 01"))
    }
}

