//
//  NetworkManager.swift
//  COVID-19
//
//  Created by Zhenya Suharevich on 15.07.2020.
//  Copyright © 2020 Zhenya Suharevich. All rights reserved.
//

import Foundation

class NetworkManager{
    let date = Date()
    func getInfo(completion: @escaping (CovidSummary?,Error?)->Void){
        let url = URL(string: "https://api.covid19api.com/summary")!
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(nil,error)
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(CovidSummary.self, from: data)
                completion(decodedData,nil)
            }catch let error{
                completion(nil,error)
            }
            
            
        }
        task.resume()
    }
    
    func getCases(for country: String, completion: @escaping ([CaseInfo]?,Error?)->Void){
        
        let url = URL(string:"https://api.covid19api.com/country/\(country.replacingOccurrences(of: " ", with: "%20"))/status/confirmed?from=2019-09-01T00:00:00Z&to=\(date.currentDateString)")!
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else{
                completion(nil,error)
                return
            }
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode([CaseInfo].self, from: data)
                completion(decodedData,nil)
                
            }catch let error{
                completion(nil,error)
            }
        }
        task.resume()
    }
}
