//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI

struct RoadMapView: View {
    
    
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            ForEach(episodeViewModel.getAllTopics()) { topic in
                TopicView(title: topic.title ?? "Sem título", content: topic.content ?? "Sem texto")
            }
        }

    }
}
// MARK: - PREVIEW
struct RoadMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        RoadMapView()
    }
}

