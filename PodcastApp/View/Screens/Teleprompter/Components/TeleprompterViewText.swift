//
//  TeleprompterViewText.swift
//  ProdCast
//
//  Created by Douglas Figueirôa on 08/02/22.
//

import SwiftUI

struct TeleprompterViewText: View {
    
    let layoutVertical = [
        GridItem(.fixed(80))
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            ScrollView(.vertical){
                LazyVGrid(columns: layoutVertical, spacing: 10){
                    ForEach(0..<150){
                        Text("item \($0)")
                            .foregroundColor(.white)
                    }
                }.background(.black) //fim LazyVGrid
            }
        }
        .frame(minWidth: 240, maxWidth: 340, minHeight: 240, maxHeight: 350, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct TeleprompterViewText_Previews: PreviewProvider {
    static var previews: some View {
        TeleprompterViewText()
    }
}
