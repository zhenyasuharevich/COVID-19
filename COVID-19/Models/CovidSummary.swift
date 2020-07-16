//
//  CovidSummary.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import Foundation


struct CovidSummary: Codable{
    var global: GlobalInfo
    var countries: [Country]
    
    enum CodingKeys: String, CodingKey{
        case global = "Global"
        case countries = "Countries"
    }
}
