//
//  GetPharmacyLocalsUseCase.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import Foundation

struct GetPharmacyLocalsWithParams {
    let offset: Int
    let limit: Int
}

class GetPharmacyLocalsUseCase: UseCase {
    
    typealias RequestType = GetPharmacyLocalsWithParams
    typealias SuccessResponseType = PharmacyResponse
    typealias FailureResponseType = DefaultFailure
    
    let repository: HomeRepositoryProtocol
    private var parameters: GetPharmacyLocalsWithParams?
    
    init(repository: HomeRepositoryProtocol = HomeRepository.shared) {
        self.repository = repository
    }
    
    func addParameters(parameters: GetPharmacyLocalsWithParams) {
        self.parameters = parameters
    }
    
    func execute(
        onSuccess: @escaping (PharmacyResponse) -> Void,
        onFailure: @escaping (DefaultFailure) -> Void,
        onConnectionFailure: (() -> Void)?) {
        
        guard let parameters = parameters else {return}
        
        self.repository.getPharmacyLocals(
            offset: parameters.offset,
            limit: parameters.limit,
            onSuccess: { (pharmacyResponse, code)  in
                onSuccess(pharmacyResponse)
            },
            onFailure: { (dataError) in
                onFailure(DefaultFailure(message: dataError.message))
        })
    }
    
}
