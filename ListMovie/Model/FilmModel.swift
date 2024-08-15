//
//  FilmModel.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation

struct FilmModel: Codable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let poster: String
    let imdbRating: String
    let imdbID: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
    }
}
