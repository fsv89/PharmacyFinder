//
//  HomePresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class HomePresenter: HomeContract.Presenter {
    weak var view: HomeContract.View?
    
    init(view: HomeContract.View) {
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
