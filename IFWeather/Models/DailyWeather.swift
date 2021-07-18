//
//  DailyWeather.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import Foundation

struct DailyWeather: Decodable {
    let days: [Day]
    
    private enum CodingKeys: String, CodingKey {
        case days = "list"
    }
}

struct Day: Decodable {
    let dt: Int64
    let temp: Temp
    let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case temp = "temp"
        case weather = "weather"
    }
}

struct Temp: Decodable {
    let day: Double?
    let min: Double
    let max: Double
    let night: Double?
    let eve: Double?
    let morn: Double?

    private enum CodingKeys: String, CodingKey {
        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }
}
