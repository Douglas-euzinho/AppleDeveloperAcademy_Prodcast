//
//  ScriptInputSpecificInfoView.swift
//  PodcastApp
//
//  Created by Douglas Figueiroa on 14/12/21.
//

import SwiftUI

struct ScriptInputSpecificInfoView: View {
    var topicoSelecionado: String
    
    @State var teste: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(topicoSelecionado)")
                .padding()
            //TextField("", $teste)
        }
    }
}

struct ScriptInputSpecificInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptInputSpecificInfoView(topicoSelecionado: "a", teste: "a")
    }
}
