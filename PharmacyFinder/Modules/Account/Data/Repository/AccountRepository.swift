//
//  AccountRepository.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

typealias AccountRepositoryProtocol =
    AccountLocalDataSourceProtocol &
    AccountRemoteDataSourceProtocol

class AccountRepository: AccountRepositoryProtocol {
    
    static let shared: AccountRepositoryProtocol = AccountRepository()

    var local: AccountLocalDataSourceProtocol

    init(local: AccountLocalDataSourceProtocol = AccountLocalDataSource()) {
        self.local = local
    }
    
    func registerUserAccount(userAccount: UserAccount) {
        self.local.registerUserAccount(userAccount: userAccount)
    }
}
