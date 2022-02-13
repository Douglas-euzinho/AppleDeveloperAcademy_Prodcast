//
//  Searchbar.swift
//  PodcastApp
//
//  Created by Victor Brito on 05/01/22.
//

import SwiftUI

struct Searchbar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack{
        ZStack {
                Rectangle()
                    .foregroundColor(Color("SearchBar"))
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Buscar episódio", text: $searchText)
                    { startedSearching in
                        if startedSearching {
                            withAnimation {
                                searching = true
                            }
                        }
                    } onCommit: {
                        withAnimation {
                            
                            searching = false
                        }
                    }
                }
                .foregroundColor(.gray)
                .padding()
            }
            Rectangle()
                .strokeBorder(.black)
                .frame(height: 39)
        }
        .frame(height: 40)
        .cornerRadius(4)
        .padding()
    }
}


struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar(searchText: .constant(""), searching: .constant(false))
    }
}

