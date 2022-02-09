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
    
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    
    var body: some View {
        List{
            ForEach(types){ type in
                NavigationLink(destination: ScriptInputInfosView().environmentObject(episodeViewModel)){
                    Text("\(type.name)")
                }
         
            }//End ForEach
            .onDelete(perform: deleteCell)
            .onMove{ (IndexSet, index) in
                types.move(fromOffsets: IndexSet, toOffset: index)
            }
            .navigationTitle("Escolha um formato")
        }//End List
        //Toolbar to do the delete and pick/drag cells
        .toolbar{
            EditButton()
        }
        .navigationViewStyle(.stack)
    }//End Body
    //Func that delete the tapped cell
    func deleteCell(at offsets: IndexSet){
        types.remove(atOffsets: offsets)
    }
}

/*
struct ScriptFormatView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptFormatView(scriptsEntites:)
    }
}
*/
