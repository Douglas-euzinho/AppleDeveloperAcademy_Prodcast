//
//  ScriptInputSpecificInfoView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 14/12/21.
//

import SwiftUI

struct ScriptInputSpecificInfoView: View {
    @ObservedObject var topic: Topics
    @State var desc: String = ""
    @State var title: String = ""
    
    var body: some View {
        //TODO: Custom TextEditor view to conform prototype
        VStack(alignment: .center){
            Form{
                Section{
                    TextField("\(topic.nameType)", text: $title)
                        .font(.title)
                }
                Section{
                    TextField("\(topic.description)", text: $desc)
                }
            }
        }//fim VStack
        .navigationTitle("Alterar/Criar")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button{
                    topic.description = desc
                    if title.count != 0 { topic.nameType = title }
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
