//
//  MultipleSelectionRow.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 07/02/22.
//

import SwiftUI

struct MultipleSelectionRow: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void

    
    var body: some View {
        Button(action: self.action) {
            HStack{
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "chekmark")
                }
            }
        }
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRow(title: "Segunda", isSelected: true, action: {})
    }
}
