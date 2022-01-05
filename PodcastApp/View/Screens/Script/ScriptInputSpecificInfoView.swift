//
//  ScriptInputSpecificInfoView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 14/12/21.
//

import SwiftUI

struct ScriptInputSpecificInfoView: View {
    @State var nameType: String = ""
    @State var description: String = ""
    @ObservedObject var scriptsEntites: configureInitialTopics
    
    var body: some View {
        //TODO: Custom TextEditor view to conform prototype
        VStack(alignment: .center){
            Form{
                Section{
                    TextField("Cabeçalho", text: $nameType)
                }
                Section{
                    TextField("Descrição", text: $description)
                }
            }
        }//fim VStack
        .navigationTitle("Alterar/Criar")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button{
                    
                    scriptsEntites.topics.append(Topics(nameType: self.nameType, description: self.description))
                }label: {
                    Label("Salvar",systemImage: "square.and.arrow.down")
                }
            }
        }
    }
}
/*
struct ScriptInputSpecificInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputSpecificInfoView()
    }
}
*/
