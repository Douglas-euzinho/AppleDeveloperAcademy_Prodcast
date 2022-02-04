//
//  ProgressDetailCheckboxView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailCheckboxView: View {
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("blue-button"))
                }
                
                Text("Roteirizado")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding()
                
                Image(systemName: "book.circle.fill")
                    .resizable()
                    .frame(width: 110, height: 90)
            } //: VSTACK
        } //: ZSTACK
        .frame(width: 152, height: 179)
    }
}

struct ProgressDetailCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDetailCheckboxView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
