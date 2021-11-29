//
//  Extension.swift
//  Lab1
//
//  Created by George Weaver on 11.11.2021.
//

import Foundation

extension String {
    
    struct ValidationInfo {
        let errorText: String
        let result: Bool
        let key: String
    }
    
//    func isValidLogin() -> ValidationInfo {
//        var validTrue: Bool
//        let inputRegEx = "^[a-zA-Z0-9\\_-]{2,25}$"
//        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
//        validTrue = inputPred.evaluate(with: self)
//        return ValidationInfo.init(errorText: "text error", result: validTrue, key: "login")
//    }
    
    func isValidLogin() -> Bool {
        let inputRegEx = "^[a-zA-Z0-9\\_-]{2,25}$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_=+{}?>.<:;~`']{8,}$"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let inputRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let inputPred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputPred.evaluate(with: self)
    }
}

extension KeyPath where Root: NSObject {
    var toString: String {
        NSExpression(forKeyPath: self).keyPath
    }
}

