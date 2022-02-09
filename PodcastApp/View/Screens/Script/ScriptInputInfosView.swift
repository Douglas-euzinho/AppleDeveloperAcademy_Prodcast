//
//  ScriptInputInfosView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 13/12/21.
//

import SwiftUI

struct ScriptInputInfosView: View {
    
    
   // var selectedTopic: String
    @State private var showingAlert = false
    @State private var topicName = ""
    @State private var showingVisualizer = false
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    
    var body: some View {
        //TODO: CREATE DELETE TOPIC FUNTION
            ZStack{
                List{
                    ForEach((episodeViewModel.episode?.script?.topics?.allObjects as! [Topic])){ topic in
                        Section{
                            Text("\(topic.title ?? "Sem título")")
                            NavigationLink {
                                ScriptInputSpecificInfoView(topic: topic).environmentObject(episodeViewModel)
                            } label: {
                                Text("\(topic.content ?? "Sem texto")")
                            }
                        }//End Section
                    }//End ForEach
                    //FIXME: ADD REMOVE TOPICS ACTION
//                    .onDelete { IndexSet in
//                        config.topics.remove(atOffsets: IndexSet)
//                    }
                }//End List
                .toolbar{ EditButton()}
                .navigationTitle("Roteiro")
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
                            showingVisualizer = true
                            
                        } label: {
                            if episodeViewModel.episode?.script?.topics?.allObjects.count ?? 0 > 0 {
                                NavigationLink(destination: RoadMapView().environmentObject(episodeViewModel), isActive: $showingVisualizer) {
                                    Text("Visualizar")
                                        .foregroundColor(Color("accent-color"))
                                        .padding(.top)
                                }
                            }
                          
                        }
                    }
                }
                //Show Custom View to input topic name
                CustomAlertView(title: "Adicionar Tópico", isShown: $showingAlert, text: $topicName) { name in
                    //TODO: CREATE METHOD IN MODELVIEW TO ADD TOPIC
                    if name.count != 0 { episodeViewModel.createTopic(title: name)}
                }
            }
        .navigationViewStyle(.stack)
        //End NavigationView
    }//End Body
}

/*
struct ScriptInputInfosView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputInfosView(selectedTopic: "Resenha")
    }
}*/

