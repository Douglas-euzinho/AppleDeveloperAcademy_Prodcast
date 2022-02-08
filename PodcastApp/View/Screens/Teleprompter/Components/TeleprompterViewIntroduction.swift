//
//  TeleprompterViewIntroduction.swift
//  ProdCast
//
//  Created by Douglas Figueirôa on 08/02/22.
//

import SwiftUI


struct Title{
    var title: String
    var description: Description
}

struct Description{
    var description: String
}

struct TitleFormatPrompt: View{
    var body: some View{
        
        
        ZStack {
            Rectangle()
                .cornerRadius(radius: 10, corners: [.topLeft , .topRight])
            Text("Introdução")
                .foregroundColor(.white)
        }
        .frame(width: 140, height: 75)
        
    }
}

struct DescriptionFormatPrompt: View{
    var body: some View{
        
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 3)
            .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
            Text("Olá a todos, me chamo fulano de tal e gostaria de introduzi-los a uma nova experiência...")
                .padding()
        }
        .frame(width: 140, height: 115)
        
    }
}

struct TeleprompterViewIntroduction: View {
    var body: some View {
        ZStack{
            VStack{
                TitleFormatPrompt()
                DescriptionFormatPrompt()
                    .offset(y: -15)
            }
        }
        .frame(width: 140, height: 175)
    }
}

struct TeleprompterViewIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        TeleprompterViewIntroduction()
    }
}
