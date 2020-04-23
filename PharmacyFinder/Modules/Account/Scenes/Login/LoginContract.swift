//
//  LoginContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol: class {
    func doLoginWithUsername(userAccount: UserAccount)
}

protocol LoginViewProtocol: class {
    func displayLoginError(alertController: UIAlertController)
    func doPushViewController()
}

class LoginContract: Contract {
    typealias Presenter = LoginPresenterProtocol
    typealias View = LoginViewProtocol
}
