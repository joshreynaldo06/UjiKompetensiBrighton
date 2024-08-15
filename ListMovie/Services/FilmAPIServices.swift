//
//  FilmAPIServices.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

class FilmAPIServices {
    
    private let apiURL = "https://www.omdbapi.com/?apikey=13efafc"
    
    func fetchMovies(completion: @escaping (Result<FilmSearchResponse, Error>) -> Void) {
        guard let url = URL(string: apiURL + "&s=Marvel") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(FilmSearchResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchCertainMovies(title: String, completion: @escaping (Result<FilmSearchResponse, Error>) -> Void) {
        guard let url = URL(string: apiURL + "&s=\(title)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(FilmSearchResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchFilmDetails(title: String, completion: @escaping (Result<FilmModel, Error>) -> Void) {
            
            guard let url = URL(string: apiURL + "&i=\(title)") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(FilmModel.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    
}
