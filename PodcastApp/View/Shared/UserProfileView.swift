//
//  UserProfileView.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 17/12/21.
//

import SwiftUI

struct UserProfileView: View {
    let screen = UIScreen.main.bounds
    var name: String
    var image: UIImage?
    
    var body: some View {
        HStack(spacing: 15) {
            Image(uiImage: image ?? UIImage(systemName: "person.circle.fill")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 62, height: 62)
            
            Text(name)
                .font(.custom("Helvetica Neue", size: 22))
                .fontWeight(.semibold)
                .padding(.leading, 5)
                .lineLimit(2)
            Spacer()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(name: "Vida de Estudante")
    }
}
