//
//  PharmacyDetailContract.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 24-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

protocol PharmacyDetailPresenterProtocol: class {
    
}

protocol PharmacyDetailViewProtocol: class {
}

class PharmacyDetailContract: Contract {
    typealias Presenter = PharmacyDetailPresenterProtocol
    typealias View = PharmacyDetailViewProtocol
}
