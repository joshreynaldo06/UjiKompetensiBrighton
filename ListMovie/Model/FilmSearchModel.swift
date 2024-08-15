//
//  FilmSearchModel.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation

struct FilmSearchResponse: Codable {
    let search: [MovieItem]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct MovieItem: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
