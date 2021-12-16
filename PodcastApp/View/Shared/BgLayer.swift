//
//  BgLayer.swift
//  PodcastApp
//
//  Created by Victor Brito on 16/12/21.
//

import SwiftUI

struct BgLayer: View {
    var body: some View {
        ZStack{
        Rectangle()
            .foregroundColor(Color.white)
            .cornerRadius(60)
        Rectangle()
            .foregroundColor(Color.white)
            .frame(width: 200, height: 200)
            .position(x: 290, y: 100)
        }
    }
}

struct BgLayer_Previews: PreviewProvider {
    static var previews: some View {
        BgLayer()
    }
}
