//
//  CustomAlertView.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 16/12/21.
//

import SwiftUI

struct CustomAlertView: View {
    let screenSize = UIScreen.main.bounds
    
    var title: String = ""
    var subtitle: String = ""
    var showInput = true
    var isConfirmation = false
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    var deleteAction:() -> Void = { }
    var body: some View {
    
        ZStack {
            if isShown {
                Color("alert-background-color")
                    .ignoresSafeArea(.all)
            } else {}
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.headline)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.subheadline)
                }
                //MARK: INPUT TEXT
                if showInput {
                    TextEditor(text: $text)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.black, lineWidth: 2.1)
                        )
                        .frame(minHeight: 40, maxHeight: 40)
                        .cornerRadius(7)
                }
 
                
                HStack() {
                    Spacer()
                    Button("Cancelar") {
                        self.isShown = false
                        self.onCancel()
                    }
                    .buttonStyle(cancelButton())
                    .padding(.trailing, 10)
                    
                    
                    Button(isConfirmation ? "Excluir" : "Salvar") {
                        if isConfirmation {
                            self.deleteAction()
                            self.isShown = false
                        } else {
                            self.onDone(self.text)
                            self.isShown = false
                        }
                    }
                    .buttonStyle(doneButton())
                    .padding(.leading, 10)
                    Spacer()
                }
            }
            .padding()
            .frame(width: UIDevice.current.localizedModel == "iPad" ? screenSize.width * 0.35 :  screenSize.width * 0.83 , height: screenSize.height * 0.23)
            .background(Color.init(uiColor: UIColor.init(named: "background-color") ?? UIColor.gray))
            .opacity(1.3)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black)
            )
            .offset(y: isShown ? 0 : screenSize.height)
        }
    }
}

struct doneButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 40)
            .background(Color("accent-color"))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct cancelButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 40)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("accent-color"))
            )
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Adicionar Tópico", isShown: .constant(true), text: .constant(""), deleteAction: {print("delete")})
    }
}
