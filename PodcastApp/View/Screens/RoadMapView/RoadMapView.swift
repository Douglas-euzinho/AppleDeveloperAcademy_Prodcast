//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct RoadMapView: View {
    @EnvironmentObject var model: EpisodeViewModel
    @Environment(\.presentationMode) var presentation
    @State private var showingExporter = false
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool  = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("background-color")
                .ignoresSafeArea()
            ScrollView {
                ForEach(model.getAllTopics()) { topic in
                    TopicView(title: topic.title ?? "Sem título", content: topic.content ?? "Sem texto")
                }
            }
            .fileExporter(
                isPresented: $isExporting,
                document: MessageDocument(message: model.getFormattedScript()),
                contentType: UTType.plainText,
                defaultFilename: "\(model.episode.title ?? "roteiro")"
            ) { result in
                if case .success = result {
                    print("Success")
                } else {
                    print("Failure")
                }
            }
            .padding(.top, 20)
        }
        .navigationTitle(model.episode.wrappedTitle)
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem {
                Button {
                    isExporting = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isExporting = true
                    }
                }
            label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(Color("accent-color"))
            }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color("accent-color"))
                    
                    Text("Editar Roteiro")
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent-color"))
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
        }
    }
}

