//
//  LoginWithUsernameUseCase.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoginWithUsernameUseCase {
    
    let accountRepository: AccountRepositoryProtocol

    init(accountRepository: AccountRepositoryProtocol = AccountRepository.shared) {
        self.accountRepository = accountRepository
    }
    
    func execute() -> UserAccount?{
        return self.accountRepository.getUserAccount()
    }

}

