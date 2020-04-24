//
//  RequestError.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

public struct RequestError {
    var statusCode: Int
    var jsonData: Data?
    var error: Error?

    public init(statusCode: Int,
         jsonData: Data? = nil,
         error: Error? = nil) {
        self.statusCode = statusCode
        self.jsonData = jsonData
        self.error = error
    }
}
