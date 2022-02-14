//
//  EpisodeProgressView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 01/02/22.
//

import SwiftUI

struct EpisodeProgressView: View {
    @EnvironmentObject var episode: Episode
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack (spacing: 5){
                    Image("progress\(episode.status)Percent")
                        .resizable()
                        .frame(width: 25, height: 175)
                    VStack(alignment: .leading, spacing: 20){
                        Text("Roterizado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 17))
                            .foregroundColor(Color.black)
                        Text("Gravado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 17))
                            .foregroundColor(Color.black)
                        
                        Text("Editado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 17))
                            .foregroundColor(Color.black)
                        
                        Text("Lançado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 17))
                            .foregroundColor(Color.black)
                    }
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}




struct EpisodeProgressView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeProgressView()
    }
}

