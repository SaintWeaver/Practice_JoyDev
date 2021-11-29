//
//  SearchResponse.swift
//  Lab1
//
//  Created by George Weaver on 21.11.2021.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int?
    let results: [Track?]
}

struct Track: Decodable {
    let trackName: String?
    let collectionName: String?
    let artistName: String?
    let artworkUrl60: String?
}
