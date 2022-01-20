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
                .fill(Color.init(uiColor: UIColor.init(named: "secundary-color") ?? UIColor.white))
                 .frame(width: 152, height: 213)
            StatesOfPodcast(episode: episode)
        }
        
    }
}
//struct CardsEps_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CardsEpsView(episode: )
//    }
//}

