//
//  LoginViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginContract.Presenter?
    
    convenience init() {
        self.init(nibName: "LoginViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = LoginPresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.doSomething()
    }
}

extension LoginViewController: LoginContract.View {
    func displaySomething() {
        // do something
    }
}

