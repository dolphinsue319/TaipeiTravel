//
//  TTError.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/28.
//

import Foundation

enum TTError: Error {
    case unknown(Error)
    case invalidURL
    case invalidServerResponse
    case invalidJSON
    case URLSessionError(Error)
}
