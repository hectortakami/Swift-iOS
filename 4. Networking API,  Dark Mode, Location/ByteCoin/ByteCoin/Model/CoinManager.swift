//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coin: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "61170A00-E2E4-44AA-A133-A3F6D3341979"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performHTTPRequest(url){
            (response) in
            let coinModel = CoinModel(currency: response.asset_id_quote, rate: response.rate)
            self.delegate?.didUpdateCurrency(coinModel)
        }
    }
    
    func performHTTPRequest(_ urlStr: String, completition: @escaping (CoinAPIResponse) -> ()){
        if let url = URL(string: urlStr){
            URLSession.shared.dataTask(with: url){
                data, res, err in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(CoinAPIResponse.self, from: data) {
                        completition(json)
                    }
                }
                if err != nil {
                    self.delegate?.didFailWithError(err!)
                }
            }.resume()
        }
    }
    
}
