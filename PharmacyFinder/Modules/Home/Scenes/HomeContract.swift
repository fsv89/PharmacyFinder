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
    func doFilterPharmacies(listToFilter: [Record]?)
}

protocol HomeViewProtocol: class {
    func displayPopulatedTableView(pharmacies: PharmacyResponse)
    func displayAlertController(alertController: UIAlertController)
    func displayUpdatedTableView(pharmacies: [Record]?)
}

class HomeContract: Contract {
    typealias Presenter = HomePresenterProtocol
    typealias View = HomeViewProtocol
}
