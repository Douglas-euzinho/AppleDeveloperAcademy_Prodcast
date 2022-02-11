//
//  NewProjectScreen.swift
//  PodcastApp
//
//  Created by Victor Brito on 17/12/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct RoadMapView: View {
    @EnvironmentObject var episodeViewModel: EpisodeViewModel
    @State private var document: MessageDocument = MessageDocument(message: "Hello, World!")
    @State private var showingExporter = false
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("background-color")
                .ignoresSafeArea()
            
           /* ScrollView {
                ForEach(episodeViewModel.getAllTopics()) { topic in
                    TopicView(title: topic.title ?? "Sem título", content: topic.content ?? "Sem texto")
                }
            }*/
            
            GroupBox(label: Text("TESTE")) {
                TextEditor(text: $document.message)
            }
            .fileExporter(
                isPresented: $showingExporter,
                document: document,
                contentType: UTType.plainText,
                defaultFilename: "Message"
            ) { result in
                if case .success = result {
                    print("Success")
                } else {
                    print("Failure")
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    //isExporting = false
                    
                    //fix broken picker sheet
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
                    // TODO: ADD EDIT ACTION
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

//extension URL {
//    func mimeType() -> String {
//        let pathExtension = self.pathExtension
//        if let type = UTType(filenameExtension: pathExtension) {
//            if let mimetype = type.preferredMIMEType {
//                return mimetype as String
//            }
//        }
//        return "application/octet-stream"
//    }
//}
//// MARK: - PREVIEW
//struct RoadMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoadMapView()
//    }
//}

