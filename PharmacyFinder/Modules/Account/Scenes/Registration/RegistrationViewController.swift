//
//  RegistrationViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {
    var presenter: RegistrationContract.Presenter?
    
    convenience init() {
        self.init(nibName: "RegistrationViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = RegistrationPresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.doSomething()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = StringConstants.REGISTRATION_TITLE
    }
}

extension RegistrationViewController: RegistrationContract.View {
    func displaySomething() {
        // do something
    }
}
