//
//  ModelableProtocol.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 13/01/22.
//

import Foundation

protocol Modelable: ObservableObject{
    
    func update()
    func save()
}

