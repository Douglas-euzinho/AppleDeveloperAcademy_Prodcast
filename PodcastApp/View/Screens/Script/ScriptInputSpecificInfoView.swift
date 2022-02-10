//
//  ScriptInputSpecificInfoView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 14/12/21.
//

import SwiftUI

struct ScriptInputSpecificInfoView: View {
    @ObservedObject var topic: Topic
    @State var desc: String = ""
    @State var title: String = ""
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //TODO: Custom TextEditor view to conform prototype
        VStack(alignment: .center){
            Form{
                Section{
                    TextField("\(topic.title ?? "Sem título")", text: $title)
                        .font(.title)
                }
                Section{
                    TextField("\(topic.content ?? "Sem conteúdo")", text: $desc)
                }
            }
        }//fim VStack
        .navigationTitle("Alterar/Criar")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button{
                    topic.content = desc
                    if title.count != 0 { topic.title = title }
                    episodeViewModel.save()
                    episodeViewModel.update()
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Salvar")
                        .foregroundColor(.black)
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
