//
//  HomeRepository.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

typealias HomeRepositoryProtocol = HomeLocalDataSourceProtocol & HomeRemoteDataSourceProtocol


class HomeRepository: HomeRepositoryProtocol {

    static let shared: HomeRepositoryProtocol = HomeRepository()

    var local: HomeLocalDataSourceProtocol
    var remote: HomeRemoteDataSourceProtocol

    init(local: HomeLocalDataSourceProtocol = HomeLocalDataSource(),
         remote: HomeRemoteDataSourceProtocol = HomeRemoteDataSource()) {
        self.local = local
        self.remote = remote
    }
    
    func getPharmacyLocals(
        offset: Int,
        limit: Int,
        onSuccess: @escaping ((PharmacyResponse, Int) -> Void),
        onFailure: @escaping ((DataSourceError) -> Void)) {
        
        self.remote.getPharmacyLocals(
            offset: offset,
            limit: limit,
            onSuccess: { (pharmacyResponse, statusCode) in
                onSuccess(pharmacyResponse, statusCode)
            },
            onFailure: { (error) in
                onFailure(error)
            })
    }
}


