//
//  HomeLocalDataSource.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import Foundation

class HomeLocalDataSource: HomeLocalDataSourceProtocol {
    let storage: StorageProtocol
    init(storage: StorageProtocol = StorageKeyChain()) {
        self.storage = storage
    }
    
}
