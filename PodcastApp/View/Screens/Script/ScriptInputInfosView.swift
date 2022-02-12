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
    @State private var showingVisualizer = false
    @State private var topicName = ""
    @State private var scriptText = ""
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //TODO: CREATE DELETE TOPIC FUNTION
        ZStack {
            Color("background-color")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Roteiro: Resenha")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .offset(y: -15)
                        .padding(.horizontal, 35)
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(episodeViewModel.getAllTopics()){ topic in
                            Text("\(topic.title ?? ""):")
                                .fontWeight(.semibold)
                            
                            TextEditor(text: $scriptText)
                                .foregroundColor(.black)
                                .padding(.vertical, 15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black)
                                )
                                .font(Font.system(size: 17, weight: .regular))
                                .background(.white)
                        }
                    } //: VSTACK
                    .padding(.horizontal, 35)
                }
                //FIXME: ADD REMOVE TOPICS ACTION
                //                    .onDelete { IndexSet in
                //                        config.topics.remove(atOffsets: IndexSet)
                //                    }
            }//End List
            
            //Show Custom View to input topic name
            CustomAlertView(title: "Adicionar Tópico", isShown: $showingAlert, text: $topicName) { name in
                //TODO: CREATE METHOD IN MODELVIEW TO ADD TOPIC
                if name.count != 0 { episodeViewModel.createTopic(title: name)}
            }
            .navigationViewStyle(.stack)
        }
        .toolbar{ EditButton() }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    showingAlert = true
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color("accent-color"))
                        
                        Text("Adicionar Tópico")
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent-color"))
                    }.padding(.top)
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {
                    showingVisualizer = true
                } label: {
                    if episodeViewModel.getAllTopics().count > 0 {
                        NavigationLink(destination: RoadMapView().environmentObject(episodeViewModel), isActive: $showingVisualizer) {
                            Text("Visualizar")
                                .foregroundColor(Color("accent-color"))
                                .padding(.top)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        //End NavigationView
    }//End Body
}
    //End NavigationView
//End Body

/*
 struct ScriptInputInfosView_Previews: PreviewProvider {
 static var previews: some View {
 ScriptInputInfosView(selectedTopic: "Resenha")
 }
 }*/
