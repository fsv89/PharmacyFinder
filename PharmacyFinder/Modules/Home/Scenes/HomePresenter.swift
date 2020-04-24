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
    weak var view: HomeContract.View?
    
    init(view: HomeContract.View) {
        self.view = view
    }
    
    private func genericDataError() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: StringConstants.ALERT_LOGIN_ERROR, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringConstants.ALERT_OK_BUTTON, style: .default, handler: nil))
        return alert
    }
}

extension HomePresenter: HomeContract.Presenter {
    func doLoadPharmacies() {
        let pharmacyParams = GetPharmacyLocalsWithParams(offset: 0, limit: 30)
        self.getPharmacyLocalsUseCase.addParameters(parameters: pharmacyParams)
        
        self.getPharmacyLocalsUseCase.execute(
        onSuccess: { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.view?.displayPopulatedTableView(pharmacies: response)
        },
        onFailure: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.view?.displayDataError(alertController: strongSelf.genericDataError())
        },
        onConnectionFailure: { [weak self]  in
            guard let self = self else { return }
            self.view?.displayDataError(alertController: self.genericDataError())
        })
    }
}
