// *******************************************************
// STEP 2. Convert the Custom Response -> Swift Model that
//         stores all the values in a manageable struct model
// *******************************************************

import Foundation

struct WeatherModel {
    var cityName: String
    var temperature: Float
    var id: Int
    
    // Computable Properties
    // (It's value is generated based on a function result)
    var conditionIcon: String {
        return getConditionIcon(conditionID: id)
    }
    var temperatureStr: String {
        if temperature.truncatingRemainder(dividingBy: 1) == 0{
            return  String(format: "%.0f", temperature)
        }else{
            return String(format: "%.1f", temperature)
        }
    }
    
    func getConditionIcon(conditionID: Int) -> String{
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
