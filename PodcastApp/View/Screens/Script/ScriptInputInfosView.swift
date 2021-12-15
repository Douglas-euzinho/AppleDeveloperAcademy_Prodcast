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
    Topics(nameType: "Tema", description: ""),
    Topics(nameType: "Vinheta", description: ""),
    Topics(nameType: "Introdução", description: ""),
    Topics(nameType: "Conteúdo", description: ""),
    Topics(nameType: "Comentário", description: ""),
    Topics(nameType: "Finalização", description: "")
]
struct ScriptInputInfosView: View {
    var tipoSelecionado: String
    @State var descriptionBinding: String = ""
    var body: some View {
        NavigationView{
            List(initialTopics){ value in
                Section{
                    Text("\(value.nameType):")
                    NavigationLink(destination: ScriptInputSpecificInfoView(topicoSelecionado: value.nameType, teste: descriptionBinding)){
                        //TextField("", text: $descriptionBinding)
                        Text("\(value.description)")
                    }
                }
            }//End List
            .navigationTitle("Roteiro: \(tipoSelecionado)")
        }//End NavigationView
    }//End Body
}
struct ScriptInputInfosView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputInfosView(tipoSelecionado: "a")
    }
}
