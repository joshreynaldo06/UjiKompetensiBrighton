//
//  FavoriteFilmViewController.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

class FavoriteFilmViewController: UIViewController {
    
    var favoriteFilms: [FilmModel] = []
    
    @IBOutlet weak var listMovieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.retrieveFavorites()
    }
    
    private func retrieveFavorites() {
        favoriteFilms = UserDefaults.standard.loadFavorites() ?? []
        listMovieTableView.reloadData()
        
    }
    
    private func setupTableView() {
        listMovieTableView.delegate = self
        listMovieTableView.dataSource = self
        let nib = UINib(nibName: "ListFilmTableViewCell", bundle: nil)
        listMovieTableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
}

extension FavoriteFilmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = favoriteFilms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListFilmTableViewCell
        cell.setupCellAppearances(filmImagePath: movies.poster, filmTitle: movies.title, filmYear: movies.year)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmDetailViewController: FilmDetailViewController = UIStoryboard(name: "FilmDetail", bundle: nil).instantiateViewController(withIdentifier: "filmDetail") as! FilmDetailViewController
        filmDetailViewController.movieTitle = favoriteFilms[indexPath.row].imdbID
        self.navigationController?.pushViewController(filmDetailViewController, animated: true)
    }
}
