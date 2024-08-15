//
//  SearchViewModel.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation

class SearchViewModel {
    
    private var filmAPIService = FilmAPIServices()
    var movies: [MovieItem] = []
    
    func fetchCertainMovies(title: String, completion: @escaping () -> Void) {
        filmAPIService.fetchCertainMovies(title: title) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.search
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }
    
}
