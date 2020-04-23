//
//  RegistrationPresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class RegistrationPresenter: RegistrationContract.Presenter {
    
    weak var view: RegistrationContract.View?
    var registerWithUsernameUseCase = RegisterWithUsernameUseCase()
    
    init(view: RegistrationContract.View) {
        self.view = view
    }
    
    func doRegisterUserAccount(userAccount: UserAccount) {
        self.registerWithUsernameUseCase.addParameters(parameters: userAccount)
        self.registerWithUsernameUseCase.execute()
        self.view?.displayLoginViewController()
    }
}
