//
//  FilmDetailViewController.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

class FilmDetailViewController: UIViewController {
    
    @IBOutlet weak var filmActorLabel: UILabel!
    @IBOutlet weak var filmWriterLabel: UILabel!
    @IBOutlet weak var filmDirectorLabel: UILabel!
    @IBOutlet weak var filmGenreLabel: UILabel!
    @IBOutlet weak var filmSynopsisTextView: UITextView!
    @IBOutlet weak var filmRatingLabel: UILabel!
    @IBOutlet weak var filmDurationLabel: UILabel!
    @IBOutlet weak var filmDateLabel: UILabel!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var filmPosterImageView: UIImageView!
    
    var movieTitle: String?
    
    let viewModel = FilmDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.fetchFilmDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func fetchFilmDetails() {
        guard let title = movieTitle else { return }
        viewModel.fetchFilmDetails(title: title) { [weak self] in
            self?.updateUI()
        }
    }
    
    private func updateUI() {
        if let filmDetails = viewModel.filmDetails {
            filmPosterImageView.loadImage(from: filmDetails.poster)
            filmTitleLabel.text = filmDetails.title
            filmDateLabel.text = filmDetails.released
            filmDurationLabel.text = filmDetails.runtime
            filmRatingLabel.text = filmDetails.imdbRating
            filmSynopsisTextView.text = filmDetails.plot
            filmGenreLabel.text = filmDetails.genre
            filmDirectorLabel.text = filmDetails.director
            filmWriterLabel.text = filmDetails.writer
            filmActorLabel.text = filmDetails.actors
        }
    }
    
    @IBAction func addFavoritesTapped(_ sender: UIButton) {
        if let filmDetails = viewModel.filmDetails {
            UserDefaults.standard.saveToFavorites(filmDetails)
        }
    }
}
