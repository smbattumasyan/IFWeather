//
//  WeatherEndpoint.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

enum WeatherEndpoint {
    case get(lat: String, lon: String)
}

extension WeatherEndpoint: Endpoint {
    
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
            return "/data/2.5/weather"
        }
    }
    
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .get(let lat, let lon):
            return [URLQueryItem(name: "lat", value: lat), URLQueryItem(name: "lon", value: lon), URLQueryItem(name: "appid", value: Constants.APP_ID)]
        }
    }
}
