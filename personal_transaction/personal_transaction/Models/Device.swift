//
//  Device.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import Foundation

class MainDevice {
    static var versionNumber: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }
}
