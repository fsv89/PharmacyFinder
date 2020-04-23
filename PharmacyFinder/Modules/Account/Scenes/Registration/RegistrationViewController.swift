//
//  RegistrationViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = StringConstants.REGISTRATION_TITLE
    }
    
    @IBAction func onPressSignUp(_ sender: UIButton) {
        let userAccount = UserAccount(username: self.textFieldUsername.text ?? "",
                                      password: self.textFieldPassword.text ?? "")
        self.presenter?.doRegisterUserAccount(userAccount: userAccount)
    }
}

extension RegistrationViewController: RegistrationContract.View {
    func displayLoginViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
