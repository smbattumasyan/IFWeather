//
//  Weather.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

//Decodable Model
struct Weather: Decodable {
    let id: Int64
    let main: String
    let description: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case icon = "icon"
        case description = "description"
    }
}
