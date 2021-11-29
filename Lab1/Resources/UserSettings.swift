//
//  UserDefaults.swift
//  Lab1
//
//  Created by George Weaver on 12.11.2021.
//

import Foundation

struct UserSettings {
    
    private enum SettingsKeys: String {
        case login
        case password
    }
    
    static var userLogin: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.login.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.login.rawValue
            if let login = newValue {
                print("value: \(login) was added to key \(key)")
                defaults.set(login, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userPassword: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.password.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.password.rawValue
            if let password = newValue {
                print("value: \(password) was added to key \(key)")
                defaults.set(password, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

struct UserModel {
    let login: String
    let password: String
}
