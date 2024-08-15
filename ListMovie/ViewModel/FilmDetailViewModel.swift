//
//  FilmDetailViewModel.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation

class FilmDetailViewModel {
    
    private let filmDetailService = FilmAPIServices()
    var filmDetails: FilmModel?
    
    func fetchFilmDetails(title: String, completion: @escaping () -> Void) {
        filmDetailService.fetchFilmDetails(title: title) { [weak self] result in
            switch result {
            case .success(let filmModel):
                self?.filmDetails = filmModel
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print("Failed to fetch film details: \(error.localizedDescription)")
            }
        }
    }
    
}
