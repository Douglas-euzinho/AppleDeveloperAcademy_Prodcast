//
//  StatesOfPodcast.swift
//  PodcastApp
//
//  Created by Victor Brito on 20/01/22.
//

import SwiftUI

struct StatesOfPodcast: View {
    @ObservedObject var episode: Episode
    var body: some View {
        
        ZStack{
            ProgressBarView(progress: Int(Float(episode.status)))
                .position(x: 20, y: 120)
                .frame(width: 152, height: 213)
            
            VStack{
                Text(episode.title ?? "Sem título")
                    .font(.custom("Helvetica Neue", size: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .offset(y: -10)
                    .frame(width: 150, height: 20, alignment: .center)
                HStack{
                    VStack(alignment: .leading){
                        Text("Roterizado ")
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                            .padding(5)
                        
                        Text("Gravado")
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                            .padding(5)
                        Text("Editado")
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                            .padding(5)
                        Text("Lançado")
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                            .padding(5)
                    }
                }
            }
        }
    }
}

//struct StatesOfPodcast_Previews: PreviewProvider {
//    static var previews: some View {
//        StatesOfPodcast()
//    }
//}
