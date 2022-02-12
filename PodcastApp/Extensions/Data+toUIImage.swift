//
//  Data+toUUImage.swift
//  ProdCast
//
//  Created by Igor Samoel da Silva on 11/02/22.
//

import Foundation

import Foundation
import UIKit

extension Data{
    func toUIImage() -> UIImage?{
        guard let image = UIImage(data: self) else{
            return nil
        }
        return image
    }
}
