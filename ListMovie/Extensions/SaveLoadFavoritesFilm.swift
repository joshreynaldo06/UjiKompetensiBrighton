//
//  SaveLoadImage.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation

extension UserDefaults {
    private var favoritesKey: String { "favoriteFilms" }

    func saveToFavorites(_ film: FilmModel) {
        var favoriteFilms = loadFavorites() ?? []
        favoriteFilms.append(film)
        if let encoded = try? JSONEncoder().encode(favoriteFilms) {
            self.set(encoded, forKey: favoritesKey)
        }
    }

    func loadFavorites() -> [FilmModel]? {
        if let savedData = self.data(forKey: favoritesKey) {
            if let films = try? JSONDecoder().decode([FilmModel].self, from: savedData) {
                return films
            }
        }
        return nil
    }
}
