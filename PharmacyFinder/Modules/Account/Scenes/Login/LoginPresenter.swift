//
//  LoginPresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoginPresenter {
    var loginWithUsernameUseCase = LoginWithUsernameUseCase()
    weak var view: LoginContract.View?
    
    init(view: LoginContract.View) {
        self.view = view
    }
    
    func showLoginError(){
        let alert = UIAlertController(title: nil, message: StringConstants.ALERT_LOGIN_ERROR, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringConstants.ALERT_OK_BUTTON, style: .default, handler: nil))
        self.view?.displayLoginError(alertController: alert)
    }
}

extension LoginPresenter: LoginContract.Presenter {
    func doLoginWithUsername(userAccount: UserAccount) {
        if let registeredUser = self.loginWithUsernameUseCase.execute() {
            if userAccount.username == registeredUser.username &&
               userAccount.password == registeredUser.password {
                self.view?.doPushViewController()
            } else {
                self.showLoginError()
            }
        } else {
            self.showLoginError()
        }
    }
}
