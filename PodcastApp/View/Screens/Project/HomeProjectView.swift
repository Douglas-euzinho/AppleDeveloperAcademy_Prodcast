//
//  HomeProjectView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 17/12/21.
//

import SwiftUI

struct HomeProjectView: View {
    // MARK: - PROPERTIES
    @State private var actualDate = Date()
    
    // MARK: - BODY
    var body: some View {
        NavigationView() {
            VStack(alignment: .leading) {
                Text("Progresso")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                CardsEpsView()
                    .foregroundColor(.clear)
                
                Text("Roteiro")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                NavigationLink(destination: HomeView()) {
                    GroupBox(label: Label("Resenha", systemImage: "person.fill")
                    ) {
                        ScrollView(.vertical, showsIndicators: false) {
                            Text("Testando a caixa de mensagem do GroupBox")
                        }
                    }
                    .frame(maxWidth: 322, maxHeight: 228)
                    .buttonStyle(PlainButtonStyle())
                }
                
                Text("Lançamento")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                    DatePicker("", selection: $actualDate, in: ...Date(), displayedComponents: .date)
                    .tint(.red)
                    .frame(width: 20, alignment: .leading)
            }
        }
        .navigationBarTitle(Text("Tipos de Comida"))
    }
}

struct HomeProjectView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProjectView()
    }
}
