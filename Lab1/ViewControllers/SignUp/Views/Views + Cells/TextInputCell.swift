//
//  TextInputTableCell.swift
//  Lab1
//
//  Created by George Weaver on 30.10.2021.
//



// create struct registrartionData
// описать ключ enum передавать значение проперти по keypath
// искать индекс ячейки по keypath


import UIKit

protocol TextInputCellDelegate: AnyObject {
    
    func loginText(_ text: String, and type: RegistrationDataType)
    
}

class TextInputCell: UITableViewCell {
    
    var cellType: RegistrationDataType = .login
    weak var delegate: TextInputCellDelegate?
    
    override var reuseIdentifier: String? {
        return String(describing: self)
    }

    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 1
        //textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
        cellAppearance()
        textField.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ type: RegistrationDataType, and text: String?) {
        cellType = type
        textField.placeholder = type.placeholder
        textField.text = text
        if type == .password || type == .repeatPassword {
            textField.isSecureTextEntry = true
        } else {
            textField.isSecureTextEntry = false
        }
    }

    private func setUpLayout() {
        contentView.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }

    private func cellAppearance() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    @objc func handleTextChange() { 
        let text = textField.text ?? ""
        switch cellType {
        case .login:
            if text.isValidLogin() {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        case .email:
            if text.isValidEmail() {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        case .password:
            if text.isValidPassword() {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        default:
            if text.isValidPassword() {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
}

extension TextInputCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else { return false }
        let newText = text.replacingCharacters(in: range, with: string)
        delegate?.loginText(newText, and: cellType)
        return true
    }
}


