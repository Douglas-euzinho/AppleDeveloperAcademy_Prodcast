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
            .fill(Color.black)
            .frame(width: 152, height: 213)
            StatesOfPodcast()
                .position(x: 200, y: 240)
        }
        
    }
}
