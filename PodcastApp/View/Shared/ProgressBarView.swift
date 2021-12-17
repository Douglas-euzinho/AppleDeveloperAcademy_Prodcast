//
//  ProgressBar.swift
//  PodcastApp
//
//  Created by Victor Brito on 14/12/21.
//

import SwiftUI
struct ProgressBarView: View {
    @State var progress: Int
    var body: some View {
        BarSetings(progress: progress)
            .rotationEffect(.degrees(90))
    }
}

struct BarSetings: View {
    @State var progress: Int
    var body: some View {
        VStack {
            ProgressView(value: Float(progress), total: 100)
                .accentColor(Color.green)
                .scaleEffect(x: 0.8, y: 3, anchor: .center)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progress: 25)
    }
}
