//
//  Utlis.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import Foundation
import UIKit

struct Constant {
    static var userName = "Havelio Henar"
    static var githubUrl = "https://github.com/havelio"
    static var linkedInUrl = "http://linkedin.com/in/havelio"
}

func resetDefaults() {
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
        defaults.removeObject(forKey: key)
    }
}

func open(url: String) {
    if let url = URL(string: url) {
        UIApplication.shared.open(url)
    }
}
