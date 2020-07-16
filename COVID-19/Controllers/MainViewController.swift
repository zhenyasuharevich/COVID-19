//
//  MainViewController.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var newConfirmedLabel: UILabel!
    @IBOutlet var totalConfirmedLabel: UILabel!
    @IBOutlet var newDeathsLabel: UILabel!
    @IBOutlet var totalDeathsLabel: UILabel!
    @IBOutlet var newRecoveredLabel: UILabel!
    @IBOutlet var totalRecoveredLabel: UILabel!
    @IBOutlet var buttonInfoLabel: UIButton!
    
    //MARK: - Static properties
    let networkManager = NetworkManager()
    
    //MARK: - Properties
    var globalInfo: GlobalInfo?
    var countries: [Country]?
    var date = Date()
    
    //MARK: - UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(#line,#function)
        guard countries != nil && segue.identifier == "CountriesSegue" else{ return }
        let destination = segue.destination as! CountriesTableViewController
        destination.countries = countries
    }

    //MARK: - Custom Methods
    func updateUI(){
        navigationItem.title = date.currentDateString
        
        buttonInfoLabel.isEnabled = false
        buttonInfoLabel.layer.cornerRadius = 6
        
        newConfirmedLabel.font = .boldSystemFont(ofSize: 20)
        totalConfirmedLabel.font = .boldSystemFont(ofSize: 20)
        
        newDeathsLabel.font = .boldSystemFont(ofSize: 20)
        totalDeathsLabel.font = .boldSystemFont(ofSize: 20)
        
        newRecoveredLabel.font = .boldSystemFont(ofSize: 20)
        totalRecoveredLabel.font = .boldSystemFont(ofSize: 20)
        
        getData()
    }
    private func getData(){
        networkManager.getInfo { (covidSummary, error) in
            guard let covidSummary = covidSummary else{
                if let error = error{
                    print(#line,#function,"ERROR: \(error.localizedDescription)")
                }else{
                    print(#line,#function,"ERROR: can't get data")
                }
                return
            }
            
            DispatchQueue.main.async {
                self.countries = covidSummary.countries
                self.globalInfo = covidSummary.global
                self.updateLabels()
                self.buttonInfoLabel.isEnabled = true
                }
            
        }
    }
    private func updateLabels(){
        newConfirmedLabel.text! = "  +\(globalInfo?.newConfirmed ?? 0)"
        totalConfirmedLabel.text! = "  \(globalInfo?.totalConfirmed ?? 0)"
        newDeathsLabel.text! = "  +\(globalInfo?.newDeaths ?? 0)"
        totalDeathsLabel.text! = "  \(globalInfo?.totalDeaths ?? 0)"
        newRecoveredLabel.text! = "  +\(globalInfo?.newRecovered ?? 0)"
        totalRecoveredLabel.text! = "  \(globalInfo?.totalRecovered ?? 0)"
    }
    
    //MARK: - Actions
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.buttonInfoLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.buttonInfoLabel.transform = CGAffineTransform.identity
        }
    }
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        print(#line,#function)
        getData()
    }
}
