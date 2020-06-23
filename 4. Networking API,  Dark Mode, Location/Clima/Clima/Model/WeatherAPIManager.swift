// *******************************************************
// STEP 3. Performs the networking (HTTP Requests)
// *******************************************************

import Foundation

// The Delegate protocol will inform to the ViewControllers that implements it, the changes in data of the model requested from API
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherAPIManager {
    
    var delegate: WeatherManagerDelegate?
    let apiURL = "https://api.openweathermap.org/data/2.5/weather?appid=d46ab0e1e725ec457e9e52ddecd26b67&units=metric"
    
    // OPTIONAL: Variable used when multiple calls are made simultaneously
    let dispatchGroup = DispatchGroup()
    
    // Here we modify the URL before HTTP Call
    func fetchAPICall(cityName: String, lat:String, lng:String){
        var currentWeatherURL: String
        if cityName.count > 0 {
           currentWeatherURL = "\(apiURL)&q=\(cityName.lowercased())"
        }else{
            currentWeatherURL = "\(apiURL)&lat=\(lat)&lon=\(lng)"
        }
        // Here we passed the URL to do the request and receive the response
        performHTTPRequest(currentWeatherURL){
            (response) in
            // We use the (1)custom response to populate (2)swift model
            let weatherModel = WeatherModel(cityName: response.name, temperature: response.main.temp, id: response.weather[0].id)
            // The data filter from API is sent to its delegate
            self.delegate?.didUpdateWeather(weatherModel)
        }
    }
    
    // Function to excecute HTTP Request returning a Custom Response type from JSON response
    func performHTTPRequest(_ urlStr: String, completition: @escaping (WeatherAPIResponse) -> ()){
        dispatchGroup.enter() // OPTIONAL
        if let url = URL(string: urlStr){
            URLSession.shared.dataTask(with: url){
                data, res, err in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(WeatherAPIResponse.self, from: data) {
                        self.dispatchGroup.leave() // OPTIONAL
                        completition(json)
                    }
                }
                if err != nil {
                    // Will inform the delegate if something went wrong while request
                    self.delegate?.didFailWithError(err!)
                }
            }.resume()
        }
    }
    
    
}
