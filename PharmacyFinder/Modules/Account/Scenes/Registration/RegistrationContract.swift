//
//  RegistrationContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol RegistrationPresenterProtocol: class {
    func doRegisterUserAccount(userAccount: UserAccount)
}

protocol RegistrationViewProtocol: class {
    func displayLoginViewController()
}

class RegistrationContract: Contract {
    typealias Presenter = RegistrationPresenterProtocol
    typealias View = RegistrationViewProtocol
}
