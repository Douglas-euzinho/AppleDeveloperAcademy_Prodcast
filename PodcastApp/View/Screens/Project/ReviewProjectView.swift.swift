//
//  ReviewProjectView.swift.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 17/12/21.
//

import SwiftUI

struct ReviewProjectView: View {
    var body: some View {
        NavigationLink(destination: HomeView()) {
            GroupBox(label: Label("Resenha", systemImage: "person.fill")
            ) {
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Testando a caixa de mensagem do GroupBox")
                }
            }
            .frame(maxWidth: 275, maxHeight: 200)
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct ReviewProjectView_swift_Previews: PreviewProvider {
    static var previews: some View {
        ReviewProjectView()
    }
}
