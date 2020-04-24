//
//  BaseRemoteDataSource.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import Foundation
import Alamofire

class BaseRemoteDataSource {
    
    public init() {
    }
    
    func request<T: Decodable>(
    type: T.Type,
    url: String,
    method: HTTPMethod,
    parameters: Parameters? = nil,
    encoding: ParameterEncoding = URLEncoding(),
    headers: HTTPHeaders? = nil,
    statusCodes: Range<Int> = 200..<300,
    onSuccess: @escaping ((DataResponse<T, AFError>, Int) -> Void),
    onFailure: @escaping ((RequestError) -> Void)) {
        
        NetworkRequest.shared.request(
            type: type,
            url: url,
            method: method,
            onSuccess: { (data, statusCode) in
                onSuccess(data, statusCode)
            }, onFailure: { (error) in
                onFailure(error)
            })
    }
    
}
