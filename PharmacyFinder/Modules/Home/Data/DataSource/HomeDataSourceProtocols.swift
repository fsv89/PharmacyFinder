//
//  HomeDataSourceProtocols.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

protocol HomeLocalDataSourceProtocol: class {
}

protocol HomeRemoteDataSourceProtocol: class {
    func getPharmacyLocals(
        offset: Int,
        limit: Int,
        onSuccess: @escaping ((PharmacyResponse, Int) -> Void),
        onFailure: @escaping ((DataSourceError) -> Void)
    )
}
