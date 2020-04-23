//
//  LoginViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var texFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var presenter: LoginContract.Presenter?
    
    convenience init() {
        self.init(nibName: "LoginViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = LoginPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onPressSignUp(_ sender: UIButton) {
        let destination = RegistrationViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func onPressSignIn(_ sender: UIButton) {
        let userAccount = UserAccount(username: self.texFieldUsername.text ?? "",
                                      password: self.textFieldPassword.text ?? "")
        self.presenter?.doLoginWithUsername(userAccount: userAccount)
    }
}

extension LoginViewController: LoginContract.View {
    func doPushViewController() {
        let destination = HomeViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    func displayLoginError(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
}
