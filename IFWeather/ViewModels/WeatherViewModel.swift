//
//  WeatherViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

class WeatherViewModel: ViewModelType {
    struct Input {
        let weather: Weather
    }
    
    struct Output {
        let id: Int64
        let main: String
        let description: String
        let icon: String
    }
    
    func transform(_ input: Input) -> Output {
        return Output(id: input.weather.id, main: input.weather.main, description: input.weather.description, icon: input.weather.icon)
    }
}
