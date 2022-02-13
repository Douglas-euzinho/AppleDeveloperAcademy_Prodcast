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
    @State var podcastName: String
    @State var imageData: Data?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var homeModel: HomeViewModel
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("background-color")
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        Image(uiImage: imageData?.toUIImage() ?? UIImage(named: "emptyProfile")!)
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
                        .padding(.top, 5)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Nome do Podcast")
                            .bold()
                            .font(.title2)
                            .padding(.horizontal, 25)
                            .padding(.bottom, 10)
                        
                        
                        TextField(podcastName, text: $podcastName )
                            .textFieldStyle(MyTextFieldStyle())
                            .padding(.bottom, 25)
                  //TODO: Create notifications flow screens
//                        Text("Recursos")
//                            .bold()
//                            .font(.title2)
//                            .padding(.horizontal, 25)
//                            .padding(.bottom, 10)
//
//                        NavigationLink(destination: ConfigViewAllNotifications().environmentObject(configModel)){
//                            HStack {
//                                Text("Notificações")
//                                    .font(.system(size: 18))
//                                    .fontWeight(.regular)
//
//                                Spacer()
//
//                                Image(systemName: "chevron.right")
//                                    .font(.system(size: 18))
//                                    .padding(.trailing, 5)
//                                    .foregroundColor(Color("accent-color"))
//                            }
//                            .padding(10)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                    .stroke(.black, lineWidth: 2)
//                            )
//                            .background(
//                                .white
//                            )
//                        }
//                        .padding(.horizontal, 25)
//                        .foregroundColor(.black)
                    }
                    .padding(.top)
                    Spacer()
                }
                .padding(.top, 70)
            }
            .ignoresSafeArea()
            .onTapGesture {
                self.hideKeyboard()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(imageData: $imageData)
            }
            .navigationBarTitle(Text("Configações"), displayMode: .inline)
            .navigationBarItems(leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancelar")
                            .foregroundColor(Color("accent-color"))
                    }),
                    trailing:
                    Button(action: {
                        configModel.profile.wrappedName = podcastName
                        configModel.profile.image = imageData
                        configModel.save()
                        homeModel.update()
                    presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Salvar")
                            .foregroundColor(Color("accent-color"))
                    })
        )


        }
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
        ConfigView(podcastName: "Vida de estudante")
    }
}
