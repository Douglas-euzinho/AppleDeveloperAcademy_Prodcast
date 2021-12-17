//
//  CardsEps.swift
//  PodcastApp
//
//  Created by Victor Brito on 13/12/21.
//

import SwiftUI

struct CardsEpsView: View {
    @ObservedObject var episode: Episode
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white))
                 .frame(width: 152, height: 213)
            StatesOfPodcast(episode: episode)
        }
        
    }
}

struct StatesOfPodcast: View {
    @ObservedObject var episode: Episode
    var body: some View {
        HStack{
            ProgressBarView(progress: Int(Float(episode.status)))
                .position(x: 20, y: 120)
        }
        .frame(width: 152, height: 213)
        VStack{
            Text(episode.title ?? "Sem título")
                .font(.custom("Helvetica Neue", size: 13))
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

struct CardsEps_Previews: PreviewProvider {
    static var previews: some View {
        CardsEpsView(episode: PersistenceController.shared.fetchAllEpisodes().first!)
    }
}


