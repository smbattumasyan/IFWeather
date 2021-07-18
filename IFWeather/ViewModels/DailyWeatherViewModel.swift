//
//  DailyWeatherViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import Foundation

protocol DailyWeatherViewModelDelegate: AnyObject {
    func parseDailyWeatherSuccess()
    func parseDailyWeatherWithMessage(_ message: String)
}

class DailyWeatherViewModel: NSObject {
    
    // MARK: - Public Properties
    weak var delegate: DailyWeatherViewModelDelegate?
    var dailyWeather: DailyWeather? {
        didSet {
            delegate?.parseDailyWeatherSuccess()
        }
    }
    
    // MARK: - Public Methods
    func requestWeather(lat: Double, lon: Double) {
        NetworkService.shared.request(DailyWeatherEndpoint.get(lat: "\(lat)", lon: "\(lon)")) { (result: Result<DailyWeather>) in
            switch result {
            case .success(let dailyWeather):
                self.dailyWeather = dailyWeather
            case .failure(let error):
                self.delegate?.parseDailyWeatherWithMessage(error.localizedDescription)
            }
        }
    }
}
