//
//  MainViewController.swift
//  Lab1
//
//  Created by George Weaver on 25.10.2021.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController {
    
    private var selectedIndex = 1
    private var userData: UserData = .init()
    var tableView = UITableView()
    var viewModel = ViewModel()
    private var headerView: HeaderView!
    private var footerView: FooterView!
    var types: RegistrationDataType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTableView()
        setupHeaderView()
        //setupFooterView()
        setupDataSource()
    }
    
    private func setupTableView() {
        tableView.register(TextInputCell.self, forCellReuseIdentifier: String(describing: TextInputCell.self))
        tableView.separatorStyle = .none 
        tableView.clipsToBounds = false
        tableView.delegate = self
    }
    
    private func setupMainView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupHeaderView() {
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        headerView = header
        headerView.segmentedControl.selectedSegmentIndex = selectedIndex
        headerView.delegate = self
        headerView.configure(selectedIndex)
        tableView.tableHeaderView = headerView
    }
    
//    private func setupFooterView() {
//        let footer = FooterView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
//        footerView = footer
//        footerView.delegate = self
//        footerView.configure(viewModel.screenType)
//        tableView.tableFooterView = footerView
//    }
    
    private func setupDataSource() {
        tableView.dataSource = viewModel
    }
    
    private func clearData() {
        userData = .init()
    }
    
    private func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Поля не заполнены", message: userMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
        
    }
}

extension SignUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        footerView = footer
        footerView.delegate = self
        footerView.configure(viewModel.screenType)
        return footerView
    }
}

extension SignUpViewController: FooterViewDelegate {
    func buttonTapped() {
        
        if (!userData.login.isEmpty || !userData.email.isEmpty || !userData.password.isEmpty || !userData.repeatPassword.isEmpty) {
            let mainVC = TabBarController()
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = mainVC
        } else {
            displayMyAlertMessage(userMessage: "Нужно заполнить все поля")
            return
        }
        
        UserDefaults.standard.set(userData.login, forKey: (\UserData.login).toString)
        UserDefaults.standard.set(userData.password, forKey: (\UserData.password).toString)
        UserDefaults.standard.synchronize()
    }
}


extension SignUpViewController: HeaderViewDelegate {
    func segmentedTapped(_ index: Int) {
        selectedIndex = index
        switch index {
        case 0:
            viewModel.screenType = .login
            viewModel.textFieldCellData = [.login, .password]
        case 1:
            viewModel.screenType = .signUp
            viewModel.textFieldCellData = [.login, .email, .password, .repeatPassword]
        default:
            return
        }
        clearData()
        tableView.reloadData()
    }
}


    
  

