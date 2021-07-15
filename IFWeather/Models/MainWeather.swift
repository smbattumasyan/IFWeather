//
//  MainWeather.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

//Decodable Model
struct MainWeather: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int64
    let humidity: Int64
    var sea_level: Int64?
    var grndLevel: Int64?
    let feelsLike: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case grndLevel = "grnd_level"
        case feelsLike = "feels_like"
    }
}
