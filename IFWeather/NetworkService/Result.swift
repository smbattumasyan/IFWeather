//
//  Result.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import Foundation

// MARK: - Result
/** Generic enum used for either the success or failure of an operation */

enum Result<T> {
    case success(T)
    case failure(Error)
}

// MARK: - Result Callback
typealias ResultCallback<T> = (Result<T>) -> Void
