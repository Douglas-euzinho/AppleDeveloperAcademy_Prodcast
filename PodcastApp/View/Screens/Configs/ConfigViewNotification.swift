//
//  ConfigViewNotification.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct NotificationAtributes: Identifiable{
    var id = UUID()
    var day: Date
    var time: String
    var title: String
    var message: String
}

let notis = [
    NotificationAtributes(day: Date.now, time: "16:50", title: "sim", message: "mensagem"),
    NotificationAtributes(day: Date.now, time: "18:50", title: "nao", message: "sem menssagem")

]

struct FullScreenModelViewDay: View{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack{
            Form{
                Section{
                    Text("just a teste day")
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Salvar")
                    }
                }//End Section
            }//End Form
        }//End VStack
    }//End body
}

struct FullScreenModelViewTime: View{
    
    var body: some View{
        VStack{
           Text("teste")
        }//End VStack
    }//End body
}

struct ConfigViewNotification: View {
    
    @State var notificationToggle: Bool = false
    @State var day: Bool = false
    @State var time: Bool = false
    
    var body: some View {
        Form{
            Section{
                Toggle(isOn: $notificationToggle) {
                    Text("Permitir Notificação")
                        .font(.subheadline)
                }
            }//End Section 1
            
            Section{
                NavigationLink(destination: FullScreenModelViewTime.init) {
                    Text("Dia")
                }
                Text("Horário")
                Text("Título")
                Text("Mensagem")
                Button {
                    self.day.toggle()
                } label: {
                    Text("Salvar")
                }
                .fullScreenCover(isPresented: $day, content: FullScreenModelViewDay.init)

            }//End Section 2
            
        }//End Form
    }//End body
}//End struct


struct DefineDayNotification: View{
    var body: some View{
        Text("um teste")
    }
}

struct ConfigViewNotification_Previews: PreviewProvider {
    static var previews: some View {
        ConfigViewNotification()
    }
}
