//
//  ScriptInputInfosView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 13/12/21.
//

import SwiftUI

struct Topics: Identifiable{
    var id = UUID()
    var nameType: String
    var description: String = ""
}

var initialTopics = [
    Topics(nameType: "Tema", description: "Um texto de um amigo meu que pediu para digitar isso aqui e agora estamos vendo no que vai dar #vaicurintiam"),
    Topics(nameType: "Vinheta", description: ""),
    Topics(nameType: "Introdução", description: ""),
    Topics(nameType: "Conteúdo", description: ""),
    Topics(nameType: "Comentário", description: ""),
    Topics(nameType: "Finalização", description: "")
]
struct ScriptInputInfosView: View {
    var tipoSelecionado: String
    var body: some View {
        //TODO: CREATE DELETE TOPIC FUNTION
            List(initialTopics){ value in
                Section{
                    Text("\(value.nameType):")
                    NavigationLink(destination: ScriptInputSpecificInfoView(content: value.description)){
                        Text("\(value.description)")
                            .frame(height: value.description.isEmpty ? 10 : 100, alignment: .leading)
                    }
                }
            }//End List
            .navigationTitle("Roteiro: \(tipoSelecionado)")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //TODO: Create action to add topic
                    } label: {
                        VStack{
                            Image(systemName: "plus.circle.fill").foregroundColor(.black)
                            Text("Adicionar Tópico").foregroundColor(.black)
                        }.padding(.top)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        //TODO: Create action to present text
                    } label: {
                        VStack{
                            Image(systemName: "doc.plaintext").foregroundColor(.black)
                            Text("Visualizar").foregroundColor(.black)
                        }.padding(.top)
                    }

                }
        }
        //End NavigationView
    }//End Body
}
struct ScriptInputInfosView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputInfosView(tipoSelecionado: "Resenha")
    }
}
