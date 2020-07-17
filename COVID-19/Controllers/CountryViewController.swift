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
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Static Properties
    let networkManager = NetworkManager()
    let cellManager = CellManager()
    
    // MARK: - Propetries
    var country: Country!
    var cases: [CaseInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        updateUI()
        networkManager.getCases(for: country.name) { (data, error) in
            guard let data = data else{
                if let error = error{
                    print(#line,#function,"ERROR: \(error.localizedDescription)")
                }else{
                    print(#line,#function,"ERROR: can't get data")
                }
                return
            }
            self.cases = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(self.cases)
        }
        
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
extension CountryViewController:UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cases?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CasesCell", for: indexPath)
        let caseInfo = cases?[indexPath.row]
        cellManager.congifure(cell, with: caseInfo ?? CaseInfo(date: "", cases: 0))
        return cell
    }
    
    
}
extension CountryViewController: UITableViewDelegate{
    
}

