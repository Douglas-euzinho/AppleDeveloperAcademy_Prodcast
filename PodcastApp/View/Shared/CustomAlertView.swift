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
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    
    var body: some View {
    
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack(spacing: 20) {
                Button("Criar") {
                    self.isShown = false
                    self.onDone(self.text)
                }
                Button("Cancelar") {
                    self.isShown = false
                    self.onCancel()
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.23)
        .background(Color.init(uiColor: UIColor.init(named: "Background") ?? UIColor.white))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)

    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Add Item", isShown: .constant(true), text: .constant(""))
    }
}
