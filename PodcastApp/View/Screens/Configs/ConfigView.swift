//
//  ConfigView.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct ConfigView: View {
    
    @StateObject var configModel = ConfigViewModel()
    
    var body: some View {
            VStack(alignment: .leading){
                
                Form{
                    Section{
                        //ak fica a foto do perfil
                        
                    }//End Section 1
                    
                    Section{
                        Text("Nome do Podcast")
                            .font(.title2)
                        TextField("Podcast name...", text: $configModel.profile.wrappedName )
                    }//End Section 2
                    
                    Section{
                        Text("Recursos")
                            .font(.title2)
                        
                        NavigationLink(destination: ConfigViewAllNotifications().environmentObject(configModel)){
                            Text("Notificações")
                                .font(.subheadline)
                        }
                    }//End Section 3
                }//End Form
            }//End VStack
    }//End body
}//End struct

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
