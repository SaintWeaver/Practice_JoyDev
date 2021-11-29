//
//  Types.swift
//  Lab1
//
//  Created by George Weaver on 28.11.2021.
//

import Foundation

enum RegistrationDataType {
    case login
    case email
    case password
    case repeatPassword

    var placeholder: String {
        switch self {
        case .login:
            return "Логин"
        case .email:
            return "E-mail"
        case .password:
            return "Пароль"
        case .repeatPassword:
            return "Повторить пароль"
        }
    }
    var key: String {
        switch self {
        case .login:
            return "login"
        case .email:
            return "email"
        case .password:
            return "password"
        case .repeatPassword:
            return "repeatPassword"
        }
    }
}

enum ScreenType {
    case signUp
    case login
}
