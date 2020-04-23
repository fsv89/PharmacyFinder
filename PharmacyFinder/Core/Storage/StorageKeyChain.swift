//
//  StorageKeyChain.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit
import Locksmith

class StorageKeyChain: StorageProtocol {

    func get(key: StorageEnum) -> Any? {
        if let dictionary = Locksmith.loadDataForUserAccount(userAccount: key.rawValue) {
            return dictionary[key.rawValue]
        }
        debugPrint("Failed to retrieve keychain data")
        return nil
    }

    func save(value: Any, forKey key: StorageEnum) {
        do {
            var dictionary: [String: Any] = [:]
            dictionary[key.rawValue] = value
            try Locksmith.updateData(data: dictionary, forUserAccount: key.rawValue)
        } catch {
            debugPrint("Failed to save keychain data")
        }
    }

    func remove(key: StorageEnum) {
        do {
            try Locksmith.deleteDataForUserAccount(userAccount: key.rawValue)
        } catch {
            debugPrint("Failed to remove keychain data")
        }
    }
}
