//
//  CurrentWeather.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

//Decodable Model
struct CurrentWeather: Decodable {
    let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: MainWeather
    let visibility: Int64
    let wind: Wind
    let clouds: Clouds
    let date: Int64
    let weatherSpecific: WeatherSpecific
    let timezone: Int64
    let id: Int64
    let name: String
    let cod: Int64
    
    private enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case date = "dt"
        case weatherSpecific = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}
