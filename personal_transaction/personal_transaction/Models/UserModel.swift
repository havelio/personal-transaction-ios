//
//  UserModel.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import Foundation

enum UserDefaultsKeys : String {
    case userName,
         githubUrl,
         linkedinUrl
}

extension UserDefaults {

    @objc dynamic var fullName: String {
        get { return string(forKey: UserDefaultsKeys.userName.rawValue) ?? "Havelio Henar" }
        set { set(newValue, forKey: UserDefaultsKeys.userName.rawValue) }
    }
    
    @objc dynamic var githubUrl: String {
        get { return string(forKey: UserDefaultsKeys.githubUrl.rawValue) ?? "" }
        set { set(newValue, forKey: UserDefaultsKeys.githubUrl.rawValue) }
    }
    
    @objc dynamic var linkedinUrl: String {
        get { return string(forKey: UserDefaultsKeys.linkedinUrl.rawValue) ?? "" }
        set { set(newValue, forKey: UserDefaultsKeys.linkedinUrl.rawValue) }
    }
}
