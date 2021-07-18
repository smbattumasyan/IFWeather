//
//  MainWeather.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import Foundation

class MainWeatherViewModel: ViewModelType {
    struct Input {
        let weather: MainWeather
    }
    
    struct Output {
        let temp: String
        let tempMin: Double
        let tempMax: Double
        let pressure: String
        let humidity: String
        var sea_level: Int64?
        var grndLevel: Int64?
        let feelsLike: Double
    }
    
    func transform(_ input: Input) -> Output {
        let temp = "\(Int(input.weather.temp))°"
        let humidity = "Humidity \(input.weather.humidity) %"
        let pressure = "Barometer \(input.weather.pressure) in Hg"
        return Output(temp: temp, tempMin: input.weather.tempMin, tempMax: input.weather.tempMax, pressure: pressure, humidity: humidity, sea_level: input.weather.sea_level, grndLevel: input.weather.grndLevel, feelsLike: input.weather.feelsLike)
    }
}
