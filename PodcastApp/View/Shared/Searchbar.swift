//
//  Searchbar.swift
//  PodcastApp
//
//  Created by Victor Brito on 05/01/22.
//

import SwiftUI

struct Searchbar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass").foregroundColor(.primary)
            TextField("Buscar episódio", text: $searchText)
                .padding(7)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black)
                )
        }
        .padding(.horizontal, 20)
        .offset(x: -10)
    }
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar(searchText: .constant("Teste"))
    }
}

