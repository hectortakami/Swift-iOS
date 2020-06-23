//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation // Package to retreive phone location

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    // Property with all the HTTP Calls to Open Weather API
    var weatherManager = WeatherAPIManager()
    // Property to grant phone GPS access
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the current ViewController to keep track of UITextField actions
        searchTextField.delegate = self
        // To keep track of API Response we need to set the current ViewController  as the delegate of the manager
        weatherManager.delegate = self
        // Asks for location permission while using the app
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

// Extensions groups Swift structures, fuctions & capabilities
//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // Hides iPhone keyboard
    }
    
    // ***************************************************
    // UITextFieldDelegate event listeners
    // ***************************************************
    
    // Triggered by the keyboard return key
    func textFieldShouldReturn(_ textField: UITextField) ->
        Bool {
            searchTextField.endEditing(true) // Hides iPhone keyboard
            return true
    }
    
    // Here we validate the text passed by the user before hit the return key on keyboard
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Enter a city name..."
            return false
        }
    }
    
    // Triggered once we accept data validation from 'textFieldShouldEndEditing', we now have the input from user to work with.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if var city = searchTextField.text {
            city = city.replacingOccurrences(of: " ", with: "+")
            self.weatherManager.fetchAPICall(cityName: city, lat: "", lng: "")
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    // We need to extend 'WeatherManagerDelegate' protocol to receive API information
    // From WeatherAPIManager (WeatherAPIManagerDelegate) of ViewController implementation we will receive the API data in this methods once we fetch the HTTP Resquest
    
    // ***************************************************
    // WeatherManagerDelegate event listeners
    // ***************************************************
    func didUpdateWeather(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureStr
            self.conditionImageView.image = UIImage(systemName: weather.conditionIcon)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}
//MARK: - CLLocationDelegate
extension WeatherViewController: CLLocationManagerDelegate{
    
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            locationManager.stopUpdatingLocation()
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude
            self.weatherManager.fetchAPICall(cityName: "", lat: "\(latitude)", lng: "\(longitude)")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
