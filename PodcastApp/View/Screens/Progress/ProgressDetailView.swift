//
//  ProgressDetailView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailView: View {
    // MARK: - PROPERTIES
    //@ObservedObject var episode: Episode
    
    var layout = [
        GridItem(.flexible(minimum: 100, maximum: 150)),
        GridItem(.flexible(minimum: 100, maximum: 150))
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color("background-color")
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text("Oba! Atualize o andamento do seu podcast.")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)
                        .offset(y: -60)
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 35) {
                            ProgressDetailCheckboxView(title: "Roteirizado")
                            ProgressDetailCheckboxView(title: "Gravado")
                            ProgressDetailCheckboxView(title: "Editado")
                            ProgressDetailCheckboxView(title: "Lançado")
                        }
                    }
                    .frame(maxHeight: 500)
                    .offset(y: -100)
                }
            }
        }
        .navigationBarTitle("Progresso", displayMode: .inline)
        .toolbar {
            EditButton()
        }
    }
}

//// MARK: - PREVIEW
//struct ProgressDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressDetailView()
//    }
//}
