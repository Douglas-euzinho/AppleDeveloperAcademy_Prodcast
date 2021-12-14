//
//  BgLayers.swift
//  PodcastApp
//
//  Created by Victor Brito on 14/12/21.
//

import SwiftUI

struct BgLayers: View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(Color.init(uiColor: UIColor.init(named: "BgLayer02") ?? UIColor.white))
            .frame(width: 350, height: 200)
            .position(x: 300, y: 149)
        RoundedRectangle(cornerRadius: 70, style: .continuous)
                .fill(Color.init(uiColor: UIColor.init(named: "BgLayer02") ?? UIColor.white))
            .frame(width: 425, height: 702)
            .position(x: 210 ,y: 400)
            //                Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white)
        }
    }
}

