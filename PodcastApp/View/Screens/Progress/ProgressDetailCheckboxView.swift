//
//  ProgressDetailCheckboxView.swift
//  PodcastApp
//
//  Created by Felipe Brigagão de Almeida on 02/02/22.
//

import SwiftUI

struct ProgressDetailCheckboxView: View {
    var title: String
    var imageName: String
    @EnvironmentObject var model: EpisodeViewModel
    @State var marked: Int
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: model.episode.status >= marked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(model.episode.status >= marked ? Color("accent-color") : Color(.black))
                }
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .padding(.top, 6)
                    .padding(.bottom)
                
                Image(imageName)
                    .resizable()
                    .frame(width: 110, height: 90)
            } //: VSTACK
            .padding()
            .onTapGesture {
                if model.episode.status == marked {
                        model.episode.status = model.episode.status - 25
                       // print("\(model.episode.status)")
                } else if model.episode.status < marked && (model.episode.status + 25) == marked {
                        model.episode.status += 25
                        print("\(model.episode.status)")
                }
                model.save()
                model.update()
            }
        } //: ZSTACK
        .cornerRadius(18)
        .frame(width: 152, height: 179)
    }
}

struct ProgressDetailCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDetailCheckboxView(title: "Roteirizado", imageName: "", marked: 25)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
