//
//  HomeRemoteDataSource.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit
import Alamofire

class HomeRemoteDataSource: BaseRemoteDataSource, HomeRemoteDataSourceProtocol {
    
    func getPharmacyLocals(
        offset: Int,
        limit: Int,
        onSuccess: @escaping ((PharmacyResponse, Int) -> Void),
        onFailure: @escaping ((DataSourceError) -> Void)) {
        
        var url = "http://datos.gob.cl/api/action/datastore_search?offset={offset}&limit={limit}&resource_id=a60f93af-6a8a-45b6-85ff-267f5dd37ad6"
        
        url = url.replacingOccurrences(of: "{offset}", with: String(offset))
        url = url.replacingOccurrences(of: "{limit}", with: String(limit))

        request(
            type: PharmacyResponse.self,
            url: url,
            method: .get,
            onSuccess: { (data, statusCode) in
                switch data.result {
                case .success(let value):
                    onSuccess(value, statusCode)
                case .failure:
                    onFailure(DataSourceError.dataError())
                }
        },
            onFailure: { (error) in
                onFailure(DataSourceError.errorFrom(error))
        })
        
    }

}
