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
            VStack{
                Text(episode.title ?? "Sem título")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding([.top,.leading, .trailing])
                    .lineLimit(3)
                    .font(.system(size: 13))
            
                CardEpisodeProgressView().environmentObject(episode)
                    .padding(.leading)
                HStack {
                    Spacer()
                    Image(systemName: "calendar.circle")
                        .foregroundColor(.black)
                    Text(DateFormatter.formatedDate.string(from: episode.date ?? Date()))
                        .foregroundColor(.black)
                        .font(.custom("FONT_NAME", size: 10))
                }
                .padding(.bottom)
                .padding(.trailing)
            }
            .frame(width: 152, height: 213)
        }
    }
}


struct CardEpisodeProgressView: View {
    @EnvironmentObject var episode: Episode
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack (spacing: 5){
                    Image("progress\(episode.status)Percent")
                        .resizable()
                        .frame(width: 25, height: 150)
                    VStack(alignment: .leading, spacing: 20){
                        Text("Roteirizado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                        Text("Gravado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                        
                        Text("Editado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                        
                        Text("Lançado")
                            .multilineTextAlignment(.leading)
                            .font(.custom("FONT_NAME", size: 12))
                            .foregroundColor(Color.black)
                    }
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}








//Text(DateFormatter.formatedDate.string(from: episode.date ?? Date()))
//    .foregroundColor(.black)
//    .font(.custom("FONT_NAME", size: 10))

//struct StatesOfPodcast_Previews: PreviewProvider {
//    static var previews: some View {
//        StatesOfPodcast()
//    }
//}
