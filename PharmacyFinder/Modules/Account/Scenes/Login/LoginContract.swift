//
//  LoginContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol: class {
    func doSomething()
}

protocol LoginViewProtocol: class {
    func displaySomething()
}

class LoginContract: Contract {
    typealias Presenter = LoginPresenterProtocol
    typealias View = LoginViewProtocol
}
