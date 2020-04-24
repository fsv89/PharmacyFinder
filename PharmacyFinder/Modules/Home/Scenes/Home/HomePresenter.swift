//
//  HomePresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class HomePresenter {
    var getPharmacyLocalsUseCase = GetPharmacyLocalsUseCase()
    private var originalPharmacieList: [Record]?
    weak var view: HomeContract.View?
    
    init(view: HomeContract.View) {
        self.view = view
    }
    
    private func genericDataError() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: StringConstants.ALERT_LOGIN_ERROR, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringConstants.ALERT_OK_BUTTON, style: .default, handler: nil))
        return alert
    }
    
    private func filterList(listToFilter: [Record]?, byLocalName: String) {
        if let pharmacies = listToFilter, let originalPharmacies = originalPharmacieList {
            let filter = pharmacies.filter{$0.localNombre.lowercased() == byLocalName.lowercased()}
            if !byLocalName.isEmpty && filter.count > 0 {
                self.view?.displayUpdatedTableView(pharmacies: filter)
            } else {
                //Blank Search or Doesnt match
                self.view?.displayUpdatedTableView(pharmacies: originalPharmacies)
                if filter.count == 0 && !byLocalName.isEmpty {
                    let alert = UIAlertController(title: StringConstants.FILTER_ERROR_DOESNT_MATCH, message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: StringConstants.ALERT_OK_BUTTON, style: .default, handler: nil))
                    self.view?.displayAlertController(alertController: alert)
                }
            }
        }
    }
}

extension HomePresenter: HomeContract.Presenter {
    func doFilterPharmacies(listToFilter: [Record]?) {
        let alertController = UIAlertController(title: StringConstants.FILTER_TITLE, message: nil, preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: StringConstants.ALERT_FILTER_BUTTON, style: .default) { [unowned self] _ in
            let userInput = alertController.textFields?[0].text ?? ""
            self.filterList(listToFilter: listToFilter, byLocalName: userInput)
        })

        alertController.addAction(UIAlertAction(title: StringConstants.ALERT_CANCEL_BUTTON, style: .cancel))
        self.view?.displayAlertController(alertController: alertController)
    }
    
    func doLoadPharmacies() {
        self.view?.displayLoading(show: true)
        let pharmacyParams = GetPharmacyLocalsWithParams(offset: 0, limit: 30)
        self.getPharmacyLocalsUseCase.addParameters(parameters: pharmacyParams)
        
        self.getPharmacyLocalsUseCase.execute(
        onSuccess: { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.view?.displayPopulatedTableView(pharmacies: response)
            strongSelf.originalPharmacieList = response.result.records
            strongSelf.view?.displayLoading(show: false)
        },
        onFailure: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.view?.displayAlertController(alertController: strongSelf.genericDataError())
            strongSelf.view?.displayLoading(show: false)
        },
        onConnectionFailure: { [weak self]  in
            guard let self = self else { return }
            self.view?.displayAlertController(alertController: self.genericDataError())
            self.view?.displayLoading(show: false)
        })
    }
}
