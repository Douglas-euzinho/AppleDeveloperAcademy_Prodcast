//
//  ScriptFormatView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 13/12/21.
//

import SwiftUI

struct Types: Identifiable{
    var name: String
    var id = UUID()
}

var types = [
    Types(name: "Narrativo"),
    Types(name: "Mesa de Debate"),
    Types(name: "Reportagem"),
    Types(name: "Storytelling"),
    Types(name: "Entrevista"),
    Types(name: "Ao vivo"),
    Types(name: "Ficção"),
    Types(name: "Resenha"),
    Types(name: "Outro")
]

struct ScriptFormatView: View {
    @ObservedObject var config: configureInitialTopics
    
    var body: some View {
        NavigationView{
            List(types){ value in
                NavigationLink(destination: ScriptInputInfosView(selectedTopic: value.name)){
                    Text("\(value.name)")
                }
            }//End List
            .navigationTitle("Escolha um formato")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(config)
        //End NavigationView
    }//End Body
}

/*
struct ScriptFormatView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptFormatView(scriptsEntites: )
    }
}
*/
