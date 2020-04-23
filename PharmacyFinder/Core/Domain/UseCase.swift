//
//  UseCase.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//
import Foundation

protocol UseCase {
    associatedtype RequestType
    associatedtype SuccessResponseType
    associatedtype FailureResponseType

    func addParameters(parameters: RequestType)
    func execute(onSuccess: @escaping (SuccessResponseType) -> Void,
                 onFailure: @escaping (FailureResponseType) -> Void,
                 onConnectionFailure: (() -> Void)?)
}
