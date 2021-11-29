//
//  NetworkService.swift
//  Lab1
//
//  Created by George Weaver on 21.11.2021.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(tracks))
                } catch let jsonError {
                    print("Failed  to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
