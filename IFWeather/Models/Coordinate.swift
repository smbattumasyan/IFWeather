//
//  Coordinate.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

//Decodable Model
struct Coordinate: Decodable {
    let lon: Double
    let lat: Double
    
    private enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}
