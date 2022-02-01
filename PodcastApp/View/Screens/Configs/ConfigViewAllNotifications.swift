//
//  ConfigViewAllNotifications.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 19/01/22.
//

//MARK: - PROPERTIES FROM ANY NOTIFICATION
struct NotificationAtributes: Identifiable{
    var id = UUID()
    var day: String?
    var time: String?
    var title: String?
    var message: String?
}//End struct

import SwiftUI

struct ConfigViewAllNotifications: View {
    
    @State var createNotificationView: Bool = false
    @EnvironmentObject var configModel: ConfigViewModel
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Toggle(isOn: $configModel.profile.isActiveNotification) {
                        Text("Permitir Notificação")
                            .font(.subheadline)
                    }
                }//End Section
                List{
                    Text("vito")
                    Text("é")
                    Text("guei")
                }
            }//End Form
            
            NavigationLink(isActive: $createNotificationView) {
                ConfigViewNotification()
            } label: {
            }

        }//End VStack
        .navigationTitle("Minhas notificações")
        .toolbar{EditButton()}
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //chamar a tela de adicionar
                    self.createNotificationView = true
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill").foregroundColor(.black)
                        Text("Adicionar Notificação").foregroundColor(.black)
                    }.padding(.top)
                }
            }
        }//End toolbar
        
    }//End body
}//End struct

struct ConfigViewAllNotifications_Previews: PreviewProvider {
    static var previews: some View {
        ConfigViewAllNotifications()
    }
}
