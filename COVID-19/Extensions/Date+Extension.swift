//
//  Date+Extension.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 16.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import Foundation


extension Date{
    var currentDateString: String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentDate = formatter.string(from: date)
        return currentDate
    }
}
