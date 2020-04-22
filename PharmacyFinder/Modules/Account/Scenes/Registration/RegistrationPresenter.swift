//
//  RegistrationPresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 22-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class RegistrationPresenter: RegistrationContract.Presenter {
    weak var view: RegistrationContract.View?
    
    init(view: RegistrationContract.View) {
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
