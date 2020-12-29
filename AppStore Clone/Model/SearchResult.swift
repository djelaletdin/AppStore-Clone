//
//  SearchResult.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 29.12.2020.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
}
