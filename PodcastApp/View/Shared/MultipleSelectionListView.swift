//
//  MultipleSelectionList.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 07/02/22.
//

import SwiftUI

struct MultipleSelectionListView: View {
    
    @State var items: [String] = ["Domingo", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
    
    @Binding var selections: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                MultipleSelectionRow(title: item, isSelected: selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: {$0 == item})
                    } else {
                        self.selections.append(item)
                    }
                }
            }
        }
    }
}

struct MultipleSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionListView(selections: .constant([""]))
    }
}
