//
//  EpisodeProgressView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 01/02/22.
//

import SwiftUI

struct EpisodeProgressView: View {
    @ObservedObject var episode: Episode
    
    var body: some View {
        ZStack{
            ProgressView(value: 25, total: 100)
                .progressViewStyle(CustomRoundedCornerProgressViewStyle())
            
            HStack{
                VStack(alignment: .leading, spacing: 50){
                    Text("Roterizado ")
                        .font(.custom("FONT_NAME", size: 17))
                        .foregroundColor(Color.black)
                        .padding(5)
                    
                    Text("Gravado")
                        .font(.custom("FONT_NAME", size: 17))
                        .foregroundColor(Color.black)
                        .padding(5)
                    
                    Text("Editado")
                        .font(.custom("FONT_NAME", size: 17))
                        .foregroundColor(Color.black)
                        .padding(5)
                    
                    Text("Lançado")
                        .font(.custom("FONT_NAME", size: 17))
                        .foregroundColor(Color.black)
                        .padding(5)
                }
            }
        }
    }
}

struct CustomRoundedCornerProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(Color.green)
            .scaleEffect(x: 0.8, y: 4, anchor: .center)
            .rotationEffect(.degrees(90))
            .offset(x: -65)
    }
}

struct EpisodeProgressView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeProgressView(episode: Episode())
    }
}
