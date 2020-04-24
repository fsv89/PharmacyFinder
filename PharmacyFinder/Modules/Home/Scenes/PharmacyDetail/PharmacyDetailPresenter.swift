//
//  PharmacyDetailPresenter.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 24-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class PharmacyDetailPresenter: PharmacyDetailContract.Presenter {
    weak var view: PharmacyDetailContract.View?
    
    init(view: PharmacyDetailContract.View) {
        self.view = view
    }
}
