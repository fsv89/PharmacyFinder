//
//  RegisterWithUsername.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class RegisterWithUsernameUseCase {

    private var parameters: UserAccount?

    let accountRepository: AccountRepositoryProtocol

    init(accountRepository: AccountRepositoryProtocol = AccountRepository.shared) {
        self.accountRepository = accountRepository
    }

    func addParameters(parameters: UserAccount) {
        self.parameters = parameters
    }

    func execute() {
        guard let parameters = self.parameters else {
            debugPrint("error no parameters")
            return
        }
        self.accountRepository.registerUserAccount(userAccount: parameters)
    }

}

