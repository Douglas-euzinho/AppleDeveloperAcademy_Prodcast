//
//  ConfigView.swift
//  PodcastApp
//
//  Created by Douglas Figueirôa on 18/01/22.
//

import SwiftUI

struct ConfigView: View {
    
    //MARK: Properties
    @StateObject var configModel = ConfigViewModel()
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Spacer()
                VStack{
                    Image(uiImage: configModel.profile.image?.toUIImage() ?? UIImage(systemName: "person.circle.fill")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 62, height: 62)
                    Button {
                        showingImagePicker = true
                    } label: {
                        Text("Alterar foto do perfil")
                            .foregroundColor(Color("accent-color"))
                    }
                    
                }
                Spacer()
            }
            
            Form{
                Section{
                    Text("Nome do Podcast")
                        .bold()
                        .font(.title2)
                    TextField("Podcast name...", text: $configModel.profile.wrappedName )
                        .onChange(of: $configModel.profile.wrappedValue) { _ in
                            configModel.save()
                        }
                }//End Section
                
                Section{
                    Text("Recursos")
                        .bold()
                        .font(.title2)
                    
                    NavigationLink(destination: ConfigViewAllNotifications().environmentObject(configModel)){
                        Text("Notificações")
                            .font(.subheadline)
                    }
                }//End Section 3
            }//End Form
        }//End VStack
        .onTapGesture {
            self.hideKeyboard()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(imageData: $configModel.profile.image, perform: {
                configModel.save()
                configModel.update()
            })
        }
    }//End body
}//End struct

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
