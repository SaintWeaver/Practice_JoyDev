//
//  ViewModel.swift
//  Lab1
//
//  Created by George Weaver on 28.11.2021.
//

import Foundation
import UIKit

class ViewModel: NSObject {
    
    var userData: UserData = .init()
    var screenType: ScreenType = .signUp
    var headerView: HeaderView!
    lazy var textFieldCellData: [RegistrationDataType] = {
        switch screenType {
        case .signUp:
            return [.login, .email, .password, .repeatPassword]
        case .login:
            return [.login, .password]
        }
    }()
}

extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextInputCell.self), for: indexPath) as? TextInputCell else { fatalError("No TextFieldCell") }
        cell.delegate = self
        cell.configure(textFieldCellData[indexPath.row], and: cell.textField.text)
        return cell
    }
}

extension ViewModel: TextInputCellDelegate {
    func loginText(_ text: String, and type: RegistrationDataType) {
        userData.setValue(text, forKey: type.key)
    }
}
