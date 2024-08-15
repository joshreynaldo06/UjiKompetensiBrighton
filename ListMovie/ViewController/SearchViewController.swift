//
//  SearchViewController.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listMovieTableView: UITableView!
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func setupTableView() {
        listMovieTableView.delegate = self
        listMovieTableView.dataSource = self
        let nib = UINib(nibName: "ListFilmTableViewCell", bundle: nil)
        listMovieTableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search for films"
        navigationItem.titleView = searchBar
    }
    
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchFilms(query: searchText)
        }
    
}

extension SearchViewController {
    func searchFilms(query: String) {
        guard !query.isEmpty else {
            viewModel.movies = []
            self.listMovieTableView.reloadData()
            return
        }
        
        if query.count >= 5 {
            viewModel.fetchCertainMovies(title: query) {
                self.listMovieTableView.reloadData()
            }
        }
        
        
    }
}
