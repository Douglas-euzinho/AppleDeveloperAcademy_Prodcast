//
//  ConfigViewNotification.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct ConfigNotificationView: View {

    @State var days: [String] = []
    @State var dateNotification: Date = Date()
    
    @EnvironmentObject var model: ConfigViewModel
    
    var body: some View {
        Form{
            Section{
                NavigationLink {
                    MultipleSelectionListView(selections: $days)
                } label: {
                    Text("Dia")
                }
                
                HStack{
                    Text("Data")
                    DatePicker(selection: $dateNotification, displayedComponents: DatePickerComponents.hourAndMinute) {
                        EmptyView()
                    }
                }
  
                HStack{
                    Text("Titulo")
                    Spacer()
                    Text("Lançar Ep 01")
                }
                
                
                HStack{
                    Text("Mensagem")
                    Spacer()
                    Text("Não se esqueça de lançar o ep")
                }
                
                Button {
                    model.createNotification(days: [true,false,false,true,false,true,false], hour: dateNotification, title: "Episode 01", message: "Any Message")
                } label: {
                    Text("Salvar")
                }
                
            }//End Section 2
            
        }//End Form
        
    }//End body
}//End struct


struct ConfigViewNotification_Previews: PreviewProvider {
    static var previews: some View {
        ConfigNotificationView()
            .environmentObject(ConfigViewModel())
    }
}
