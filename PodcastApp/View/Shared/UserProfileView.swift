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
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
            Text(name).font(.custom("Helvetica Neue", size: 25))
                .fontWeight(.medium)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(name: "Vida de Estudante")
    }
}
