//
//  UIAplication + endEditing.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 07/02/22.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
