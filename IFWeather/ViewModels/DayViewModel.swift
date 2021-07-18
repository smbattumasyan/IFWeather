//
//  DayViewModel.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import UIKit

class DayViewModel: ViewModelType {
    struct Input {
        let day: Day
    }
    
    struct Output {
        let weekday: String
        let minMaxTemp: NSAttributedString
        let iconURL: String
    }
    
    func transform(_ input: Input) -> Output {
        let weekday = Date(timeIntervalSince1970: TimeInterval(input.day.dt)).dayOfTheWeek() ?? ""
        let max = "\(Int(input.day.temp.max))  "
        let min = "\(Int(input.day.temp.min))"
        let attributedString = NSMutableAttributedString()
        attributedString.append(addAttributedString(text: max, color: .black))
        attributedString.append(addAttributedString(text: min, color: UIColor.black.withAlphaComponent(0.5)))
        let iconURL = "http://openweathermap.org/img/w/\(input.day.weather.first?.icon ?? "").png"
        return Output(weekday: weekday, minMaxTemp: attributedString, iconURL: iconURL)
    }
    
    private func addAttributedString(text: String, color: UIColor) -> NSAttributedString {
        let maxAttribute = [ NSAttributedString.Key.foregroundColor: color ]
        return NSAttributedString(string: text, attributes: maxAttribute)
    }
}
