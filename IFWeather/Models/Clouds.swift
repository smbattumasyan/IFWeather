//
//  Clouds.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 16.07.21.
//

import Foundation

//Decodable Model
struct Clouds: Decodable {
    let all: Int64
    
    private enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}
