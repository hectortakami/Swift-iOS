//
//  OpenWeatherManager.swift
//  Clima
//
//  Created by Hector Takami on 04/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherAPIManager {
    
    let apiURL = "https://api.openweathermap.org/data/2.5/weather?appid=d46ab0e1e725ec457e9e52ddecd26b67&units=metric"
    let dispatchGroup = DispatchGroup()
    
    func fetchWeatherAPICall(cityName: String){
        let currentWeatherURL = "\(apiURL)&q=\(cityName.lowercased())"
        performHTTPRequest(urlStr: currentWeatherURL){(json) in print("finished")}
    }
    
    func performHTTPRequest(urlStr: String, completition: @escaping (WeatherData) -> ()){
        dispatchGroup.enter()
        if let url = URL(string: urlStr){
            URLSession.shared.dataTask(with: url){
                data, res, err in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(WeatherData.self, from: data) {
                        self.dispatchGroup.leave()
                        completition(json)
                    }
                }
            }.resume()
        }
    }
    
    
}
