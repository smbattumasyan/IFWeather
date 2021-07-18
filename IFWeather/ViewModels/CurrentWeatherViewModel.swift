//
//  CurrentWeatherViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

protocol CurrentWeatherViewModelDelegate: NSObject {
    func parseCurrentWeatherSuccess(_ currentWeather: CurrentWeather)
    func parseCurrentWeatherWithMessage(_ message: String)
}

class CurrentWeatherViewModel: NSObject {
    
    weak var delegate: CurrentWeatherViewModelDelegate?
    
    func requestWeather(lat: Double, lon: Double) {
        NetworkService.shared.request(WeatherEndpoint.get(lat: "\(lat)", lon: "\(lon)")) { (result: Result<CurrentWeather>) in
            switch result {
            case .success(let currentWeather):
                print(currentWeather)
                self.delegate?.parseCurrentWeatherSuccess(currentWeather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
