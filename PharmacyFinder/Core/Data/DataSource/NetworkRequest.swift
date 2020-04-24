//
//  NetworkRequest.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import Foundation
import Alamofire


enum RequestType {
    case dictionary
    case array
}

class NetworkRequest {
    static let shared = NetworkRequest()
    
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
        
        let alamofire: DataRequest!

        alamofire = AF.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding
        )
        
        let validation = alamofire.validate(statusCode: statusCodes)
        validation.responseJSON {  (responseJson) in
            switch responseJson.result {
                            case .success:
                                if let responseData = responseJson.data {
                                    if let obj = DecoderHelper.decode(type: type, data: responseData) {
                                        let newResponse = DataResponse<T, AFError>(
                                            request: responseJson.request,
                                            response: responseJson.response,
                                            data: responseData,
                                            metrics: responseJson.metrics,
                                            serializationDuration: responseJson.serializationDuration,
                                            result: .success(obj))
                                        onSuccess(newResponse, responseJson.response?.statusCode ?? 0)
                                    } else {
                                        let error = RequestError(
                                            statusCode: responseJson.response?.statusCode ?? 0)
                                        if let data = responseJson.data,
                                            let response = String(data: data, encoding: String.Encoding.utf8) {
                                            debugPrint(response)
                                        }
                                        onFailure(error)
                                    }
                                } else {
                                    let error = RequestError(
                                        statusCode: responseJson.response?.statusCode ?? 0)
                                    if let data = responseJson.data,
                                        let response = String(data: data, encoding: String.Encoding.utf8) {
                                        debugPrint(response)
                                    }

                                    onFailure(error)
                                }
                            case .failure:
                                if let data = responseJson.data, let response = String(data: data, encoding: String.Encoding.utf8) {
                                    debugPrint(response)
                                }
                                let error = RequestError(
                                    statusCode: responseJson.response?.statusCode ?? 0,
                                    jsonData: responseJson.data,
                                    error: responseJson.error)
                                onFailure(error)
            }
        }
        
    }

}
