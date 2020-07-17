//
//  CaseInfo.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 17.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import Foundation


struct CaseInfo: Codable{
    var date: String
    var cases: Int
    
    enum CodingKeys: String, CodingKey{
        case date = "Date"
        case cases = "Cases"
    }
}
