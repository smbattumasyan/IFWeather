//
//  Wind.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

//Decodable Model
struct Wind: Decodable {
    let deg: Int64
    var gust: Double?
    let speed: Double
    
    private enum CodingKeys: String, CodingKey {
        case deg = "deg"
        case gust = "gust"
        case speed = "speed"
    }
}
