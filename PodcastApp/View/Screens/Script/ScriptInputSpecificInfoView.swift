//
//  ScriptInputSpecificInfoView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 14/12/21.
//

import SwiftUI

struct ScriptInputSpecificInfoView: View {
    @State var content: String
    var body: some View {
        //TODO: Custom TextEditor view to conform prototype
        VStack(alignment: .center){
            TextEditor(text: $content).padding([.top,.leading, .trailing])
        }
    }
}

struct ScriptInputSpecificInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputSpecificInfoView(content: "Um texto de um amigo meu que pediu para digitar isso aqui e agora estamos vendo no que vai dar #vaicurintiam")
    }
}
