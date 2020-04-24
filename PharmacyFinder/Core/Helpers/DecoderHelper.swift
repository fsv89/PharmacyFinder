//
//  DecoderHelper.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class DecoderHelper {
    static func decode<T: Decodable>(type: T.Type, data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }

    static func encode<T: Encodable>( data: T) -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(data)
    }
}
