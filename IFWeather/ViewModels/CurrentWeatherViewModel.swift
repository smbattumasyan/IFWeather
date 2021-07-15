//
//  CurrentWeatherViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation
import CoreLocation

class CurrentWeatherViewModel: NSObject {
    
    func requestWeather(lat: Double, lon: Double) {
        NetworkService.shared.request(WeatherEndpoint.get(lat: "\(lat)", lon: "\(lon)")) { (result: Result<CurrentWeather>) in
            switch result {
            case .success(let currentWeather):
                print(currentWeather)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
