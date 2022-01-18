//
//  ConfigView.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct ConfigView: View {
    
    @State var nome: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading){
            Form{
                Text("Nome do Podcast")
                    .font(.title2)
                TextField("Podcast name...", text: $nome)
                
                Text("Notificações")
                    .font(.title2)
                //Section{

                NavigationLink(destination: ConfigViewNotification()){
                    Text("opa")
                }
            }
        }//End VStack
    }//End body
}//End struct

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
