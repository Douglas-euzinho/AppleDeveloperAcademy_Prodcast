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
        
        NavigationView{
            VStack(alignment: .leading){
                
                
                Form{
                    Section{
                        //ak fica a foto do perfil
                        
                    }//End Section 1
                    
                    Section{
                        Text("Nome do Podcast")
                            .font(.title2)
                        TextField("Podcast name...", text: $nome)
                    }//End Section 2
                    
                    Section{
                        Text("Recursos")
                            .font(.title2)
                        
                        NavigationLink(destination: ConfigViewAllNotifications()){
                            Text("Notificações")
                                .font(.subheadline)
                        }
                    }//End Section 3
                    
                    
                }//End Form
            }//End VStack
        }//End NavigationView
    }//End body
}//End struct

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
