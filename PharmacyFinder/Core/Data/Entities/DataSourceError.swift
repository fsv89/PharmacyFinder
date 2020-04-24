//
//  DataSourceError.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import Foundation

public struct DataSourceError {
    public enum ErrorType {
        case service
        case data
        case unknown
        case timeout
    }

    var type: ErrorType = .unknown
    var message: String = ""
    var error: RequestError?

    static func errorFrom(_ error: RequestError) -> DataSourceError {
        var result = DataSourceError()
        result.error = error
        if error.jsonData == nil {
            result.type = .data
            result.message = StringConstants.DATA_ERROR
        } else {
            switch error.statusCode {
            case 504:
                result.type = .timeout
                result.message = StringConstants.GENERIC_ERROR
            default:
                result.type = .unknown
                result.message = StringConstants.GENERIC_ERROR
            }
        }
        return result
    }

    static func dataError() -> DataSourceError {
        return DataSourceError(type: .data,
                               message: StringConstants.DATA_ERROR,
                               error: nil)
    }
}

