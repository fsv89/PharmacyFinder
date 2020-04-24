//
//  HomeContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol: class {
    func doLoadPharmacies()
}

protocol HomeViewProtocol: class {
    func displayPopulatedTableView(pharmacies: PharmacyResponse)
    func displayDataError(alertController: UIAlertController)
}

class HomeContract: Contract {
    typealias Presenter = HomePresenterProtocol
    typealias View = HomeViewProtocol
}
