//
//  StatesOfPodcast.swift
//  PodcastApp
//
//  Created by Victor Brito on 13/12/21.
//

import SwiftUI

struct StatesOfPodcast: View {
    var body: some View {
        ZStack{
            Text("Roterizado ")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.white)
                .position(x: 195, y: 340)
            Text("Gravado")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.white)
                .position(x: 188, y: 375)
            Text("Editado")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.white)
                .position(x: 186, y: 410)
            Text("Lançado")
                .font(.custom("FONT_NAME", size: 12))
                .foregroundColor(Color.white)
                .position(x: 188, y: 445)

        }
    }
}
