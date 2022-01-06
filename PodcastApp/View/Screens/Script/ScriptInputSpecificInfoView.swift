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
    
    var body: some View {
        //TODO: Custom TextEditor view to conform prototype
        VStack(alignment: .center){
            Form{
                Section{
                    TextField("Descrição", text: $desc)
                }
            }
        }//fim VStack
        .navigationTitle("Alterar/Criar")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button{
                    topic.description = self.desc
                    print("\(topic.description)")
                }label: {
                    Label("Salvar",systemImage: "square.and.arrow.down")
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
