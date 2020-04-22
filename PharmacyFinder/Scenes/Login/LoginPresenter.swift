//
//  LoginPresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoginPresenter: LoginContract.Presenter {
    weak var view: LoginContract.View?
    
    init(view: LoginContract.View) {
        self.view = view
    }

    func doSomething() {
        /*
            ...
            presentation logic
            ...
        */
        self.view?.displaySomething()
    }
}
