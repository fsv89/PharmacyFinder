//
//  RegistrationContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol RegistrationPresenterProtocol: class {
    func doSomething()
}

protocol RegistrationViewProtocol: class {
    func displaySomething()
}

class RegistrationContract: Contract {
    typealias Presenter = RegistrationPresenterProtocol
    typealias View = RegistrationViewProtocol
}
