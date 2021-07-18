//
//  WindViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import Foundation

class WindViewModel: ViewModelType {
    struct Input {
        let wind: Wind
    }
    
    struct Output {
        let deg: Int64
        var gust: Double?
        let speed: String
    }
    
    func transform(_ input: Input) -> Output {
        let speed = "Wind \(input.wind.speed) mph"
        return Output(deg: input.wind.deg, gust: input.wind.gust, speed: speed)
    }
}
