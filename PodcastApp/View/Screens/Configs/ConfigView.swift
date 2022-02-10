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
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading){
            
            Form{
                Section{
                    HStack {
                        Spacer()
                        VStack{
                            //FIXME: PERSIST IMAGE ON CORE DATA
                            Image(uiImage: inputImage ?? UIImage(systemName: "person.circle.fill")!)
                                .resizable()
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
    
                }//End Section 1
                
                Section{
                    Text("Nome do Podcast")
                        .font(.title2)
                    TextField("Podcast name...", text: $configModel.profile.wrappedName )
                        .onChange(of: $configModel.profile.wrappedValue) { _ in
                            configModel.save()
                        }
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
        .onTapGesture {
            self.hideKeyboard()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }//End body
}//End struct

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
