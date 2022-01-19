//
//  ConfigViewNotification.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct ConfigViewNotification: View {

    
    @State var chooseDay: Int = 1
    @State var chooseHour: Int = 1
    @State var chooseTitle: Int = 1
    @State var chooseMessage: Int = 1
    
    var body: some View {
        Form{
            Section{
                Picker("Dia", selection: $chooseDay) {
                    ForEach(1..<5){
                        Text("\($0) teste dia")
                    }
                }
                
                
                Picker("Hora", selection: $chooseHour) {
                    ForEach(1..<5){
                        Text("\($0) teste")
                    }
                }
                
                Picker("Titulo", selection: $chooseTitle) {
                    ForEach(1..<5){
                        Text("\($0) teste titulo")
                    }
                }
                
                Picker("Messagem", selection: $chooseMessage) {
                    ForEach(1..<5){
                        Text("\($0) teste mensagem")
                    }
                }
                
                Button {
                    //lógica do salvamento
                } label: {
                    Text("Salvar")
                }
                
            }//End Section 2
            
        }//End Form
    }//End body
}//End struct


struct ConfigViewNotification_Previews: PreviewProvider {
    static var previews: some View {
        ConfigViewNotification()
    }
}
