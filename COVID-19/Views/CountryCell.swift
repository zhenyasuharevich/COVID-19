//
//  TableViewCell.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var newConfirmedLabel: UILabel!
    @IBOutlet var totalConfirmedLabel: UILabel!
    @IBOutlet var totalDeathsLabel: UILabel!
    @IBOutlet var newDeathsLabel: UILabel!
}
