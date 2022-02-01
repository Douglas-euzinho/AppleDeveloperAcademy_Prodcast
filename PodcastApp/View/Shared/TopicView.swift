//
//  TopicView.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 14/01/22.
//

import SwiftUI

struct TopicView: View {
    @State var title: String
    @State var content: String
    
    var body: some View {
            VStack{
                Text(title)
                    .font(Font.headline.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 52)
                    .padding(.vertical, 20)
                
                Text(content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 50)
                //label named by coreData
                
            }
        
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(title: "Introdução", content: "Olá, aqui é Maria e você está ouvindo ao podcast Vida de Estudante.  Nesse episódio iremos falar sobre o livro Mulheres que correm com os lobos, de Clarissa Pinkola.")
    }
}
