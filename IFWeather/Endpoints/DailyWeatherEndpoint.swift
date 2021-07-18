//
//  DailyWeatherEndpoint.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import Foundation

enum DailyWeatherEndpoint {
    case get(lat: String, lon: String)
}

extension DailyWeatherEndpoint: Endpoint {
    
    var baseUrl: String {
        return "http://api.openweathermap.org"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .get(_, _):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .get(_, _):
            return "/data/2.5/forecast/daily"
        }
    }
    
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .get(let lat, let lon):
            return [URLQueryItem(name: "lat", value: lat), URLQueryItem(name: "lon", value: lon), URLQueryItem(name: "units", value: "metric"), URLQueryItem(name: "appid", value: Constants.APP_ID)]
        }
    }
}
