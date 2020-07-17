//
//  CellManager.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import Foundation
import UIKit

class CellManager{
    func configure(_ cell: CountryCell, with country: Country){
        cell.countryNameLabel.text = country.name
        
        cell.newConfirmedLabel.text = "(+\(country.newConfirmed))"
        cell.totalConfirmedLabel.text = "\(country.totalConfirmed)"
        
        cell.newDeathsLabel.text = "(+\(country.newDeaths))"
        cell.totalDeathsLabel.text = "\(country.totalDeaths)"
    }
    func congifure(_ cell: UITableViewCell, with caseInfo: CaseInfo){
        let date = caseInfo.date.dropLast(10)
        cell.textLabel?.text = String(date)
        cell.detailTextLabel?.text = "\(caseInfo.cases)"
    }
}
