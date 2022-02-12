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
        ZStack {
            Color("background-color")
                .ignoresSafeArea()
            
            VStack {
                Group {
                    
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
                    .offset(y: -25)
                }
                .offset(y: -55)
                .padding(.bottom, 25)
                
                VStack(alignment: .leading) {
                    Text("Nome do Podcast")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                       

                    TextField("Podcast name...", text: $configModel.profile.wrappedName )
                        .onChange(of: $configModel.profile.wrappedValue) { _ in
                            configModel.save()
                        }
                        .textFieldStyle(MyTextFieldStyle())
                        .padding(.bottom, 25)
                    
                    Text("Recursos")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
              
                    
                    NavigationLink(destination: ConfigViewAllNotifications().environmentObject(configModel)){
                        HStack {
                            Text("Notificações")
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 18))
                                .padding(.trailing, 5)
                                .foregroundColor(Color("accent-color"))
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.black, lineWidth: 2)
                        )
                        .background(
                            .white
                        )
                    }
                    .padding(.horizontal, 25)
                    .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(15)
            Spacer()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(imageData: $configModel.profile.image, perform: {
                configModel.save()
                configModel.update()
            })
        }//End Section 3
    }//End body
}//End VStack

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth: 2)
            )
            .background(
                .white
            )
            .padding(.horizontal, 25)
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
