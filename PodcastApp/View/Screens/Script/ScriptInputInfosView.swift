//
//  ScriptInputInfosView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 13/12/21.
//

import SwiftUI

//var initialTopics = [
//    Topics(nameType: "Tema", description: "Um texto de um amigo meu que pediu para digitar isso aqui e agora estamos vendo no que vai dar #vaicurintiam"),
//    Topics(nameType: "Vinheta", description: ""),
//    Topics(nameType: "Introdução", description: ""),
//    Topics(nameType: "Conteúdo", description: ""),
//    Topics(nameType: "Comentário", description: ""),
//    Topics(nameType: "Finalização", description: "")
//]
struct ScriptInputInfosView: View {
    
    
    var selectedTopic: String
    @State private var showingAlert = false
    @State private var topicName = ""
    
    @StateObject private var config = configureInitialTopics()
    
    var body: some View {
        
        //TODO: CREATE DELETE TOPIC FUNTION
        NavigationView{
            ZStack{
                List{
                    ForEach(config.topics){ value in
                        Section{
                            Text("a: \(value.nameType)")
                            Text("b: \(value.description)")
                        }
                    }
                }//End List
                .navigationTitle("Roteiro: \(selectedTopic)")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            showingAlert = true
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill").foregroundColor(.black)
                                Text("Adicionar Tópico").foregroundColor(.black)
                            }.padding(.top)
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            RoadMapView()
                        } label: {
                            Text("Visualizar").foregroundColor(.black).padding(.top)
                        }
                        
                    }
                }
                //Show Custom View to input topic name
                CustomAlertView(title: "Adicionar Tópico", isShown: $showingAlert, text: $topicName) { name in
                    //TODO: CREATE METHOD IN MODELVIEW TO ADD TOPIC
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //End NavigationView
    }//End Body
}

/*
struct ScriptInputInfosView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputInfosView(selectedTopic: "Resenha")
    }
}*/

