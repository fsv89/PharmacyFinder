//
//  AccountLocalDataSource.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

class AccountLocalDataSource: AccountLocalDataSourceProtocol {
    let storage: StorageProtocol
    init(storage: StorageProtocol = StorageKeyChain()) {
        self.storage = storage
    }
    
    func registerUserAccount(userAccount: UserAccount) {
        self.storage.save(value: userAccount.username, forKey: .userAccountUsername)
        self.storage.save(value: userAccount.password, forKey: .userAccountPassword)
    }
}
