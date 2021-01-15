//
//  Review.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 12.01.2021.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    
    private enum codingKeys: String, CodingKey{
        case author, title, content
    }
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
