//
//  UserViewController.swift
//  Lab1
//
//  Created by George Weaver on 11.11.2021.
//

import UIKit

class SearchViewController: UIViewController {

    var tableView = UITableView()
    let networkService = NetworkService()
    let searchController = UISearchController(searchResultsController: nil)
    var searchResponse: SearchResponse? = nil
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTableView()
        setupSearchBar()

    }

    private func setupMainView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .singleLine
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = searchResponse?.results[indexPath.row]
        cell.textLabel?.text = track?.trackName
        return cell
    }

}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=5"

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.networkService.request(urlString: urlString) { [weak self] Result in
                switch Result {
                case .success(let searchResponse):
                    self?.searchResponse = searchResponse
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}
