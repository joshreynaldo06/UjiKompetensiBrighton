//
//  HomeViewController.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var listMovieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.fetchMovies()
        
    }
    
    private func setupTableView() {
        listMovieTableView.delegate = self
        listMovieTableView.dataSource = self
        let nib = UINib(nibName: "ListFilmTableViewCell", bundle: nil)
        listMovieTableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func fetchMovies() {
        viewModel.fetchMovies { [weak self] in
            self?.listMovieTableView.reloadData()
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let searchViewController: SearchViewController = UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListFilmTableViewCell
        cell.setupCellAppearances(filmImagePath: movies.poster, filmTitle: movies.title, filmYear: movies.year)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmDetailViewController: FilmDetailViewController = UIStoryboard(name: "FilmDetail", bundle: nil).instantiateViewController(withIdentifier: "filmDetail") as! FilmDetailViewController
        filmDetailViewController.movieTitle = viewModel.movies[indexPath.row].imdbID
        self.navigationController?.pushViewController(filmDetailViewController, animated: true)
    }
}
