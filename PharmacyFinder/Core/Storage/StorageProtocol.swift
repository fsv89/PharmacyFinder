//
//  StorageProtocol.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

enum StorageEnum: String, CaseIterable {
    case userAccountUsername
    case userAccountPassword
}

protocol StorageProtocol {
    func get(key: StorageEnum) -> Any?
    func save(value: Any, forKey key: StorageEnum)
    func remove(key: StorageEnum)
}
