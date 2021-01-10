//
//  AppGroup.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 03.01.2021.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
