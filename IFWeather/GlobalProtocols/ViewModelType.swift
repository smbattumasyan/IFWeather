//
//  ViewModelType.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

protocol ViewModelType {
    // input datas to viewModel
    associatedtype Input
    // output view-related datas
    associatedtype Output
    // transform input datas to output datas
    func transform(_ input: Input) -> Output
}
