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
            VStack{ //VStack 1
                Text(episode.title ?? "Sem título")
                    .font(.custom("Helvetica Neue", size: 13))
                    .foregroundColor(.black)
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
                .padding(.top)
                    Label{
                        Text(DateFormatter.formatedDate.string(from: episode.date ?? Date()))
                            .foregroundColor(.black)
                            .font(.custom("FONT_NAME", size: 11))
                    } icon: {
                        Image(systemName: "calendar.circle")
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 42)
            }
            .frame(width: 152, height: 213)
        }
    }
}

extension DateFormatter{
    static let formatedDate: DateFormatter = {
        let dayMonthYear = DateFormatter()
        dayMonthYear.dateFormat = "dd/MM/yy"
        return dayMonthYear
    }()
}

//struct StatesOfPodcast_Previews: PreviewProvider {
//    static var previews: some View {
//        StatesOfPodcast()
//    }
//}
