//
//  ProgressDetailCheckboxView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailCheckboxView: View {
    var title: String
    @State var isMarked: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: isMarked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isMarked ? Color("blue-button") : Color(.black))
                }
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding()
                
                Image(systemName: "book.circle.fill")
                    .resizable()
                    .frame(width: 110, height: 90)
            } //: VSTACK
            .onTapGesture {
                isMarked.toggle()
            }
        } //: ZSTACK
        .frame(width: 152, height: 179)
    }
}

struct ProgressDetailCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDetailCheckboxView(title: "Roteirizado", isMarked: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
