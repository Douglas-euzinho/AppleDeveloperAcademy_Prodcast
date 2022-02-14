//
//  ConfigViewAllNotifications.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 19/01/22.
//

import SwiftUI

struct ConfigViewAllNotifications: View {
    
    @State var createNotificationView: Bool = false
    @EnvironmentObject var model: ConfigViewModel
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Toggle(isOn: $model.profile.isActiveNotification) {
                        Text("Permitir Notificação")
                            .font(.subheadline)
                    }
                }//End Section
                ForEach(model.profile.notifications?.allObjects as! [Notification]) { notification in
                    Text("\(notification.title ?? "No title")")
                }
            }//End Form
            
            NavigationLink(isActive: $createNotificationView) {
                ConfigNotificationView()
            } label: {
            }
            
        }//End VStack
        .navigationTitle("Minhas notificações")
        .toolbar{EditButton()}
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //Call create notification view
                    self.createNotificationView = true
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Adicionar Notificação")
                    }
                    .foregroundColor(Color("accent-color"))
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
        }//End toolbar
    }//End body
}//End struct

struct ConfigViewAllNotifications_Previews: PreviewProvider {
    static var previews: some View {
        ConfigViewAllNotifications()
            .environmentObject(ConfigViewModel())
    }
}
