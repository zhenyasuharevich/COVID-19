//
//  CountryViewController.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 16.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var totalConfirmedLabel: UILabel!
    @IBOutlet var newConfirmedLabel: UILabel!
    @IBOutlet var newDeathsLabel: UILabel!
    @IBOutlet var totalDeathsLabel: UILabel!
    @IBOutlet var totalRecoveredLabel: UILabel!
    @IBOutlet var newRecoveredLabel: UILabel!
    
    // MARK: - Propetries
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    private func updateUI(){
        countryNameLabel.text = country.name
        totalConfirmedLabel.text = "\(country.totalConfirmed)"
        newConfirmedLabel.text = "\(country.newConfirmed)"
        totalDeathsLabel.text = "\(country.totalDeaths)"
        newDeathsLabel.text = "\(country.newDeaths)"
        totalRecoveredLabel.text = "\(country.totalRecovered)"
        newRecoveredLabel.text = "\(country.newRecovered)"
    }

}
