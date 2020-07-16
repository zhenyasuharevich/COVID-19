//
//  CountriesTableViewController.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    // MARK: - Static Properties
    let networkManager = NetworkManager()
    let cellManager = CellManager()
    // MARK: - Properties
    var countries:[Country]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "CountrySegue" else { return }
        guard let countryIndex = tableView.indexPathForSelectedRow else { return }
        let destionation = segue.destination as! CountryViewController
        destionation.country = countries[countryIndex.row]
    }
}


// MARK: UITableViewDataSource
extension CountriesTableViewController/*:UITableViewDataSource*/{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        cellManager.configure(cell, with: countries[indexPath.row])
        return cell
    }
}
