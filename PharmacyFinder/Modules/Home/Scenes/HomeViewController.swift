//
//  HomeViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    var presenter: HomeContract.Presenter?
    
    convenience init() {
        self.init(nibName: "HomeViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = HomePresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.doSomething()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension HomeViewController: HomeContract.View {
    func displaySomething() {
        // do something
    }
}

