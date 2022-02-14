//
//  DateFormatter+.swift
//  ProdCast
//
//  Created by Igor Samoel da Silva on 13/02/22.
//

import Foundation



extension DateFormatter{
    static let formatedDate: DateFormatter = {
        let dayMonthYear = DateFormatter()
        dayMonthYear.dateFormat = "dd/MM/yy"
        return dayMonthYear
    }()
}




