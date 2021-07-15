//
//  WeatherSpecific.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

//Decodable Model
struct WeatherSpecific: Decodable {
    var id: Int64?
    var type: Int64?
    var country: String?
    var sunrise: Int64?
    var sunset: Int64?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
