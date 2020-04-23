//
//  AccountDataSourceProtocols.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

protocol AccountLocalDataSourceProtocol: class {
    func registerUserAccount(userAccount: UserAccount)
    func getUserAccount() -> UserAccount?
}

protocol AccountRemoteDataSourceProtocol: class {
}
