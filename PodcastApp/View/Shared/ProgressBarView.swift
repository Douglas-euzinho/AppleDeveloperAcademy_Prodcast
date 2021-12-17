//
//  ProgressBar.swift
//  PodcastApp
//
//  Created by Victor Brito on 14/12/21.
//

import SwiftUI
struct ProgressBarView: View {
    var body: some View {
        BarSetings()
            .rotationEffect(.degrees(90))
    }
}

struct BarSetings: View {
    var body: some View {
        VStack {
            ProgressView(value: 50, total: 100)
                .accentColor(Color.green)
                .scaleEffect(x: 0.8, y: 3, anchor: .center)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
