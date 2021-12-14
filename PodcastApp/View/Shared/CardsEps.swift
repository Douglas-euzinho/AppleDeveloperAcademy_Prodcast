//
//  CardsEps.swift
//  PodcastApp
//
//  Created by Victor Brito on 13/12/21.
//

import SwiftUI

struct CardsEps: View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white))
            .frame(width: 152, height: 213)
                StatesOfPodcast()
        }
        
    }
}

struct StatesOfPodcast: View {
    var body: some View {
        HStack{
            ProgressBar()
                .position(x: 20, y: 108)
        }
        .frame(width: 152, height: 213)
        HStack{
            VStack(alignment: .leading){
            Text("Roterizado ")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.black)
                .padding(10)
                
            Text("Gravado")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.black)
                .padding(10)
            Text("Editado")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.black)
                .padding(10)
                Text("Lançado")
                    .font(.custom("FONT_NAME", size: 12))
                    .foregroundColor(Color.black)
                    .padding(10)



                }
            }
    }
}

struct CardsEps_Previews: PreviewProvider {
    static var previews: some View {
        CardsEps()
                }
            }


