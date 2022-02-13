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
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    @Environment(\.editMode) var editMode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //TODO: CREATE DELETE TOPIC FUNTION
        ZStack {
            Color("background-color")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Roteiro")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .offset(y: -15)
                        .padding(.horizontal, 35)
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach($episodeViewModel.topics, id: \.self){ topic in
                            HStack {
                                VStack {
                                    TextField("", text: topic.wrappedTitle)
                                    
                                    TextEditor(text: topic.wrappedContent)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                                .stroke(.black, lineWidth: 2.2)
                                        )
                                        .background(.white)
                                        .font(Font.system(size: 17, weight: .regular))
                                        .cornerRadius(4)
                                }
                                if self.editMode?.wrappedValue == .active {
                                    Button {
                                        if let index = episodeViewModel.topics.firstIndex(of: topic.wrappedValue) {
                                            episodeViewModel.deleteTopic(topic:episodeViewModel.topics.remove(at: index)) 
                                            episodeViewModel.save()
                                        }
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    .padding(.top)
                                }
                            }
                      
                        }
                        .padding(.horizontal, 35)
                        
                        
                    }
                    //: VSTACK
                    
                }
                .onDisappear {
                    episodeViewModel.save()
                }
            }//End List
            
            //Show Custom View to input topic name
            CustomAlertView(title: "Adicionar Tópico", isShown: $showingAlert, text: $topicName) { name in
                //TODO: CREATE METHOD IN MODELVIEW TO ADD TOPIC
                if !name.isEmpty {
                    episodeViewModel.createTopic(title: name)
                    topicName = ""
                }
            }
            .navigationViewStyle(.stack)
        }
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
                    }
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
                        }
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if !episodeViewModel.topics.isEmpty {
                    EditButton()
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
