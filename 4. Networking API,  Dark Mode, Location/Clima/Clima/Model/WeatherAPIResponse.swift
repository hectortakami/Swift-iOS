// *******************************************************
// STEP 1. Defines a custom response element from the API
//         JSON Response (Filters fields we want to keep)
// *******************************************************

import Foundation

// We have to define a set of structs to store JSON values response into Swift Objects, using the Decodable protocol the fields will be automatically populate by calling the 'performHTTPRequest' method in the WeatherAPIManager

// This struct represents the entire response ( Root )
struct WeatherAPIResponse: Codable {
    var name: String
    var main: Main
    var weather: [Weather]
}

// This struct represents the "main" property
struct Main: Codable {
    // Inside "main" we set all the values we want to keep
    var temp: Float
}

// This struct represents the "weather" property
struct Weather: Codable {
    // Inside "weather" we set all the values we want to keep
    var id: Int
}


// JSON RESPONSE
//  {                      <--- (WeatherAPIResponse Struct)
//      "name": "Mexico",
//      "main": {                   <--- (Main Struct)
//          "temp": 28,
//          "feels_like": 32.85,
//          "temp_min": 28,
//          "temp_max": 28,
//          "pressure": 1011,
//          "humidity": 83
//      },
//      "weather": [                <--- (Weather Struct)
//          {
//              "id": 803,
//              "main": "Clouds",
//              "description": "broken clouds",
//              "icon": "04n"
//          }
//      ],
//      "coord": {2 items},
//      "base": "stations",
//      "visibility": 10000,
//      "wind": {2 items},
//      "clouds": {1 item},
//      "dt": 1591383635,
//      "sys": {5 items},
//      "timezone": 28800,
//      "id": 1699805,
//      "cod": 200
//  }
